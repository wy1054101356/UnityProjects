using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//一些基本的工程项目文件路径
public class API17Application_XXXPath : MonoBehaviour
{
    private Camera mainCamera;
    public GameObject text;
    // Start is called before the first frame update
    void Start()
    {
        //print(Application.dataPath); //工程数据路径   
        // print(Application.streamingAssetsPath); //可以通过文件流读取的路径
        // print(Application.persistentDataPath); // 可以进行实体化的数据路径
        // print(Application.temporaryCachePath); // 临时的缓冲数据路径
        mainCamera = Camera.main;

    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
            RaycastHit hit; //这个是碰撞的物体
            bool isCollider = Physics.Raycast(ray, out hit); //检测是否有物体与射线碰撞

            if (text.GetComponent<Collider>() == hit.collider)
            {
                //如果text的碰撞器和点击到的物体的碰撞器相等 说明点击到的就是text

                Application.OpenURL("http://www.sizhisheng.icoc.bz");
                print(hit.collider);
                print(text.GetComponent<Collider>());
            }
                
        }


    }
}
