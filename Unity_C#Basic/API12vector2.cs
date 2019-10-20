using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//二维向量Vector2中的静态方法
public class API12vector2 : MonoBehaviour
{
    public Transform transform;
    // Start is called before the first frame update
    void Start()
    {
        //print(Vector2.down); //vector2 的一些相关参数
        //print(Vector2.up);
        //print(Vector2.left);
        //print(Vector2.right);
        //print(Vector2.one);
        //print(Vector2.zero);

        //Vector2 va = new Vector2(2, 2);
        //Vector2 vb = new Vector2(6, 8);

        //print(va.magnitude);    //平方和
        //print(vb.sqrMagnitude); //平方和开根号

        //transform.position.x = 1;//错误的
        //Vector2 nowPosition = transform.position;
        //nowPosition.x = 11;
        //transform.position = nowPosition;

        //下面这个函数的意思是 将vb向量的长度固定到10 但是方向不变 也就是 
        //从  6 8 10勾股 到 3 4 5  勾股 所以最后的结果是 (3.0,4.0) 向量
        //print(Vector2.ClampMagnitude(vb, 5));


        //向量的加减乘除

        Vector2 va = new Vector2(2, 2);
        Vector2 vb = new Vector2(6, 8);
        Vector2 vc = new Vector2(3, 0);
        Vector2 vd = new Vector2(1, 0);

        Vector2 res1 = vb - va;
        Vector2 res2 = va + vb;
        Vector2 res3 = va * vb;
        Vector2 res4 = vc / 3;
        Vector2 res5 = vc / vb;

        print(res1);
        print(res2);
        print(res3);
        print(res4);
        print(res5);
        print(res4 == vd);

        //其次 二维 和三维坐标可以互相赋值
    }
    //public Vector2 va = new Vector2(2, 2);
    //private Vector2 vb = new Vector2(8, 4);

    // Update is called once per frame
    void Update()
    {
        //Movetowards匀速运动  lerp是 先快后慢的运动
        //va = Vector2.MoveTowards(va, vb, Time.deltaTime);
    }

}
