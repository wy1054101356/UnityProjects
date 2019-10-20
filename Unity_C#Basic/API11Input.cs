using System.Collections;
using System.Collections.Generic;
using UnityEngine;

//输入的一些指令 键盘 鼠标 按钮
public class API11Input : MonoBehaviour
{
    public Transform cube;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //if (Input.GetButtonDown("Fire1"))
        //{
        //    print("Button Down");
        //}

        //GetAxis 用来对轴移动，可以双方向移动， 而且具有加速度和 惯性作用
        //cube.Translate(Vector3.right * Time.deltaTime * Input.GetAxis("Horizontal"));
        //GetAxisRaw 用来对轴移动，可以双方向移动 但是返回值为 1或者 -1 效果就是立马进行运动和停止
        //cube.Translate(Vector3.right * Time.deltaTime * Input.GetAxisRaw("Horizontal") *5);
        //cube.Translate(Vector3.forward * Time.deltaTime * Input.GetAxis("Vertical")     *5);
        print(Input.mousePosition);//当前鼠标的坐标
        
    }
}
