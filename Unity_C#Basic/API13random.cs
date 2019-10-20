using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//使用Random生成随机数
public class API13random : MonoBehaviour
{
    public Transform cube;
    // Start is called before the first frame update
    void Start()
    {
        //Random.InitState(0);//随机数参数种子 固定的 所以每次随机数分布都是一样的
        //Random.InitState((int)System.DateTime.Now.Ticks);//利用时间计时周期做种
    }

    // Update is called once per frame
    void Update()
    {
       

        if (Input.GetKey(KeyCode.Space))
        {
            //print(Random.Range(4, 10));//生成随机数 整数 从4-9 不包含最大的
            //print(Random.Range(4,5f));//生成随机小数 
            //print(Random.Range(3, 30)); 

            //让cube的位置在一个一米的圆*3范围内随机生成
            //cube.position = Random.insideUnitCircle * 3;
            cube.position = Random.insideUnitSphere * 3;//球体
        }
    }
}
