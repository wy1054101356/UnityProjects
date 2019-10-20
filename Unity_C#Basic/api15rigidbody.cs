using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//通过刚体控制游戏物体移动、旋转
public class api15rigidbody : MonoBehaviour
{
    public Rigidbody playerRgd;
    public Transform enemy;
    public int force;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //刚体也可以设置物体的移动和坐标等等，并且由于跳过计算 比使用 transform组件更快
        //playerRgd.position = playerRgd.transform.position + Vector3.forward * Time.deltaTime * 10;
        //这里利用MovePosition 因为利用了插值运算 所以移动比直接设置位置移动 要更平滑
        //playerRgd.MovePosition(playerRgd.transform.position + Vector3.back * Time.deltaTime * 20);

        //获取敌人减去主角的 向量方向
        //Vector3 dir = enemy.position - playerRgd.transform.position;
        //dir.y = 0;//忽略海拔地形导致的人物“弯腰”
        //Quaternion target = Quaternion.LookRotation(dir);//最终方向
        ////主角方向利用插值 一点一点的转向最终方向 
        //playerRgd.MoveRotation(Quaternion.Slerp(playerRgd.rotation, target, Time.deltaTime));

        //if (playerRgd.rotation == target)//当两者角度一样的时候 开始移动 但是失败了
        //    playerRgd.MovePosition(playerRgd.transform.position + Vector3.forward * Time.deltaTime);
        playerRgd.AddForce(Vector3.forward * force);//给物体施加一个力;

    }
}
