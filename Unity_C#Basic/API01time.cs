using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class API01time : MonoBehaviour
{
    public Transform cube;
    public int runCount = 100000;

    // Start is called before the first frame update
    void Start()
    {
        ////一些游戏中比较重要的数据

        ////deltatime 每一帧之间的时间间隔
        //Debug.Log("time.deltaTIme = " + Time.deltaTime);
        ////游戏时间方面的
        //Debug.Log("time.fixedTime = " + Time.fixedTime);
        //Debug.Log("time.time = " + Time.time);

        ////timeSinceLevelLoad 游戏从开始加载所需要用的时间
        //Debug.Log("time.timeSinceLevelLoad = " + Time.timeSinceLevelLoad);

        ////framecount 游戏当前帧数
        //Debug.Log("time.frameCount = " + Time.frameCount);
        ////realTimeSinceStartUp 游戏从开始到暂停获得这个数据的时间
        //Debug.Log("time.realtimeSinceStartup = " + Time.realtimeSinceStartup);
        //Debug.Log("time.smoothDeltaTime = " + Time.smoothDeltaTime);

        //// timescale 游戏间歇设置数据
        //Debug.Log("time.timeScale = " + Time.timeScale);
        //Debug.Log("time.unscaledDeltaTime = " + Time.unscaledDeltaTime);

        float time1 = Time.realtimeSinceStartup;
        for (int i = 1; i < runCount; i++)
        {
            Method1();
        }
        float time2 = Time.realtimeSinceStartup;
        Debug.Log(time2 - time1);

        float time3 = Time.realtimeSinceStartup;
        for (int i = 1; i < runCount; i++)
        {
            Method2();
        }
        float time4 = Time.realtimeSinceStartup;
        Debug.Log(time4 - time3);


        float time5 = Time.realtimeSinceStartup;
        for (int i = 1; i < runCount; i++)
        {
            Method0();
        }
        float time6 = Time.realtimeSinceStartup;
        Debug.Log((time6 - time5));
    }

    // Update is called once per frame
    void Update()
    {

        //Time.timeScale = 10f;
        //cube.Translate(Vector3.forward * Time.deltaTime );

    }

    //realtimesinceSTARTup 用来测试性能

    void Method0()
    {

    }
    void Method1()
    {
        int i = 1 + 2;
    }

    void Method2()
    {
        int j = 1 * 2;
    }
}
