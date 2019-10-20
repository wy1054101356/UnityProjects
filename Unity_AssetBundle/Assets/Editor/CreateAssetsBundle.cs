using System.IO; 
using UnityEditor; //使用打包空间
using UnityEngine;

public class CreateAssetsBundle 
{
    [MenuItem("Seacition/Build AssetBundles")] //在编译器中添加菜单 并且添加菜单选项

    static void BuildAllAssestBundles()
    {
        string ABdirectory = "AssetBundlesDirectory";
        if (Directory.Exists(ABdirectory) == false) // 如果目录不存在就创建
        {
            Directory.CreateDirectory(ABdirectory);
        }

        //按指定路径 方式 平台 打包到 dir路径中 dir无法自动创建需要提前创建或者利用代码创建
        BuildPipeline.BuildAssetBundles(ABdirectory, BuildAssetBundleOptions.None, BuildTarget.StandaloneWindows64);

    }
}
