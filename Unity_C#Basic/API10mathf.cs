using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//数学里的一些参数和方法
public class API10mathf : MonoBehaviour
{
    public Transform cube;
    public float speed = 3.0f;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        //向前平移 速度恒定 和插值不一样 插值是按比例进行的所以会逐渐变慢
        //cube.position = new Vector3(-1, 1, Mathf.MoveTowards(0, 10, 1f));


        //乒乓运动 来回的运动，
        //cube.position = new Vector3(-1,1, Mathf.PingPong(Time.time * speed, 10));
    }
}
