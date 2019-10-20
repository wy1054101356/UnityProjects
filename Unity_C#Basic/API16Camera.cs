using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//摄像机的相关
public class API16Camera : MonoBehaviour
{
    private Camera mainCamera;
    // Start is called before the first frame update
    void Start()
    {
        //获取主摄像机上的camera组件
        //mainCamera = GameObject.Find("MainCamera").GetComponent<Camera>();
        //或者利用camera的标签tag = MainCamera 这个条件也可以获得
        mainCamera = Camera.main;
    }

    // Update is called once per frame
    void Update()
    {
        //获取鼠标与屏幕的交点射线 
        Ray ray = mainCamera.ScreenPointToRay(Input.mousePosition);
        RaycastHit hit; //这个是碰撞的物体
        bool isCollider = Physics.Raycast(ray, out hit); //检测是否有物体与射线碰撞
        if (isCollider)
        {
            print(hit.collider); //是就输出与射线碰撞到的物体
        }
    }
}
