using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
//加载场景 需要加入Using命名空间
public class API19SceneManager : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        print(SceneManager.sceneCount);
        print(SceneManager.sceneCountInBuildSettings);
        print(SceneManager.GetActiveScene().name);
        print(SceneManager.GetSceneAt(0).name);

        SceneManager.activeSceneChanged += OnActiveSceneChanged; //场景的过度
        SceneManager.sceneLoaded += OnSceneLoaded; //场景的加载
    }

    private void OnSceneLoaded(Scene arg0, LoadSceneMode arg1)
    {
        print(arg0.name +"   "+ arg1);
    }

    private void OnActiveSceneChanged(Scene arg0, Scene arg1)
    {
        print(arg0.name);
        print(arg1.name);
    }


    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            //打开场景的不同方法 和 打开模式 默认模式是销毁当前 加载新的 
            //SceneManager.LoadScene(1);
            print(SceneManager.GetSceneByBuildIndex(1).name);

            //SceneManager.LoadScene("Menu");
        }
    }
}
