using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Threading;

//协程方法的使用  启动和关闭
public class API07coroutine : MonoBehaviour
{
    public GameObject cube;

    // Start is called before the first frame update
    void Start()
    {
        //Debug.Log("hh");
        ////changeColor();  //一般方法

        //StartCoroutine(changeColor());//利用开启协程调用启动协程方法
        //Debug.Log("hhhh");
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Space))
        {
            
            StartCoroutine("Fade"); //启动协程方法 这里写方法的名字即可 在没有参数的情况下
        }

        if (Input.GetKeyDown(KeyCode.S))
        {
            StopCoroutine("Fade");
        }

        if (Input.GetKeyDown(KeyCode.R))
        {
            cube.GetComponent<MeshRenderer>().material.color = Color.white;
        }
    }

    IEnumerator Fade()
    {
        
        //for (float i = 0f; i < 1f; i += 0.01f) //单循环模式
        for(; ; ) //死循环模式
        {
            //以0.1进行改变 给颜色渐变的效果
            //cube.GetComponent<MeshRenderer>().material.color = new Color(i, i, i, i);
            // yield return new WaitForSeconds(0.02f);//暂停一会儿 可以看出效果

            Color nowColor = cube.GetComponent<MeshRenderer>().material.color; //当前颜色   
            Color newColor = Color.Lerp(nowColor, Color.red, 0.02f);    //渐变颜色
            cube.GetComponent<MeshRenderer>().material.color = newColor; //赋值
            if (Mathf.Abs(Color.red.b - newColor.a) <= 0.01f)  
            {
                break; //如果当前颜色最开始为0 到 red 1 之间的差 小于0.01 就退出
            }
            yield return new WaitForSeconds(0.02f);
        }
    }

    //协程方法的使用
    IEnumerator changeColor()
    {
        //Debug.Log("hhhhhhhhhhhhh");
        //cube.GetComponent<MeshRenderer>().material.color = Color.blue;
        //Debug.Log("hhhhhhhhhhhhh");
        //Thread.Sleep(10000);
        yield return null;
    }
}
