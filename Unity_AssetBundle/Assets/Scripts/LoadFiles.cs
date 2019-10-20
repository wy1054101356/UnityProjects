using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.IO;
using UnityEngine.Networking; //unityWebRequest


public class LoadFiles : MonoBehaviour
{
    private string cubePath = "AssetBundlesDirectory/scenes/cube.u3d";
    private string share = "AssetBundlesDirectory/share.u3d";

    // Start is called before the first frame update
    IEnumerator Start()
    {
        ////从目录读取包
        //AssetBundle.LoadFromFile(cunePath); //先加载共享资源 贴图材质等
        //AssetBundle ab = AssetBundle.LoadFromFile(share);
        ////实例化包里面的预设对象
        //GameObject cubeBlackPrefab = ab.LoadAsset<GameObject>("CubeBlack");
        ////在游戏场景中实例化
        //Instantiate(cubeBlackPrefab);

        //也可以利用全部读取然后逐个实例化
        //Object[] obs = ab.LoadAllAssets();
        //foreach (Object o in obs) 
        //{
        //    Instantiate(o);
        //}

        /////////////////第一种加载AB LoadFromMemory( 同步和异步 )
        //异步加载AB的方式  异步创建的是AB包请求 异步调用 所以没有执行完毕就会继续 所以需要返回一个请求
        //因此 当前函数体需要作为协程 并返回等待 等待完成后继续
        //AssetBundleCreateRequest ABrequest = AssetBundle.LoadFromMemoryAsync(File.ReadAllBytes(cubePath));
        //yield return ABrequest;
        //AssetBundle ab = ABrequest.assetBundle;

        ////同步加载AB的方式 下面这句话执行完毕后才继续后面的代码
        //AssetBundle ab =  AssetBundle.LoadFromMemory(File.ReadAllBytes(cubePath));
        ////使用包内的资源
        ////实例化包里面的预设对象
        //GameObject cubeBlackPrefab = ab.LoadAsset<GameObject>("CubeBlack");
        ////在游戏场景中实例化
        //Instantiate(cubeBlackPrefab);


        ///////////////////第二种加载AB LoadFromFile
        //AssetBundle ab = AssetBundle.LoadFromFile(cubePath);
        //GameObject cubeBlackPrefab = ab.LoadAsset<GameObject>("CubeBlack");
        //Instantiate(cubeBlackPrefab);


        ///////////////////第三种加载AB 网络请求 异步
        //需要利用到缓存 第一次从网络下载存到本地 所以需要判cashe
        while (Caching.ready == false)
        {
            yield return null;
        }
        //www 有异常不会报错 会继续执行
        //WWW www = WWW.LoadFromCacheOrDownload(
        //    @"file://M:\UNITYGAME\studyProject\class10_AssetBundle\AssetBundlesDirectory\scenes\cube.u3d", 1);

        //网页中的斜杠是 ////
        //WWW www = WWW.LoadFromCacheOrDownload(
        //      @"http://localhost/AssetBundlesDirectory/scenes/cube.u3d", 1);
        //yield return www;
        //if (string.IsNullOrEmpty(www.error) == false)
        //{
        //    Debug.Log(www.error);
        //    yield break; // 不执行下面的协程代码 返回协程
        //}
        //AssetBundle ab = www.assetBundle;


        ////////////////////使用UnityWebRequest
        //string url = @"http://localhost/AssetBundlesDirectory/scenes/cube.u3d";
        string url = @"file://M:\UNITYGAME\studyProject\class10_AssetBundle\AssetBundlesDirectory\scenes\cube.u3d";

        UnityWebRequest request = UnityWebRequestAssetBundle.GetAssetBundle(url);
        yield return request.Send();
        //AssetBundle ab = DownloadHandlerAssetBundle.GetContent(request);
        AssetBundle ab = (request.downloadHandler as DownloadHandlerAssetBundle).assetBundle;


        GameObject cubeBlackPrefab = ab.LoadAsset<GameObject>("CubeBlack");
        Instantiate(cubeBlackPrefab);



        ///////////////////manifest文件的数据读写
        ///
        //AssetBundle manifestAB = AssetBundle.LoadFromFile("AssetBundlesDirectory/AssetBundlesDirectory");
        //AssetBundleManifest manifest = manifestAB.LoadAsset<AssetBundleManifest>("AssetBundlesDirectory.manifest");
        //foreach (string name in manifest.GetAllAssetBundles()) 
        //{
        //    print(name); //获得所有的manifest文件中的包
        //}

        //string[] dependens =  manifest.GetAllDependencies("cube.u3d");
        //foreach(string name in dependens)
        //{
        //    print(name);  //加载包内预设体的关联包 (如模型 材质 等等)


        //}


        ////////////////AssetBundle的卸载:减少内存/ 可能导致内容丢失
        ///

    }




    // Update is called once per frame
    void Update()
    {
        
    }
}
