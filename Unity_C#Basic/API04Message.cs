using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//游戏消息的处理 发送 接收
public class API04Message : MonoBehaviour
{
    public GameObject target;

    // Start is called before the first frame update
    void Start()
    {
        //给游戏对象gameObject发送消息 包括以下的所有组件
        //target.BroadcastMessage("hellow"); //带返回的 如果没有接受者 会报错

        //包含三个参数的发送消息，没有接受者不会报错 发送的attack 是一个函数
        //target.BroadcastMessage("Attack",null,SendMessageOptions.DontRequireReceiver);

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
