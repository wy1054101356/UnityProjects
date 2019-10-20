using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//Quaternion四元数介绍以及和欧拉角的区别
public class API14quaternion : MonoBehaviour
{
    public Transform cube;

    //让主角面向敌人
    public Transform player;
    public Transform enemy;


    // Start is called before the first frame update
    void Start()
    {
        //以下都是输出对象的旋转角 第一个是vector3 第二个是四元数模式
        //cube.eulerAngles = new Vector3(1, 1, 1);//正确给物体的旋转赋值

        //print(cube.eulerAngles);//欧拉角
        //四元数是计算中的使用 一般在代码中不直接使用
        //print(cube.rotation);//四元数 世界坐标
        //print(cube.localRotation);//局部坐标的 旋转角四元数
        //cube.eulerAngles = new Vector3(45,45,45);//正确给物体的旋转赋值
        //Quaternion.LookRotation 把三元方向转换成四元数角度方向

    }

    // Update is called once per frame
    void Update()
    {
        //获取敌人减去主角的 向量方向
        Vector3 dir = enemy.position - player.position;
        dir.y = 0;//忽略海拔地形导致的人物“弯腰”


        //设置主角的方向 = 把向量转换成四元数角度后的方向 一下就转过去的方法
        //player.rotation = Quaternion.LookRotation(dir);

        Quaternion target = Quaternion.LookRotation(dir);//最终方向
        //主角方向利用插值 一点一点的转向最终方向 
        player.rotation = Quaternion.Slerp(player.rotation, target, Time.deltaTime);
    }
}
