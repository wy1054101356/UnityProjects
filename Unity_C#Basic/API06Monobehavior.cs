using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//游戏对象的一些基本操作和属性
public class API06Monobehavior : MonoBehaviour
{
    public Cube cube;
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log(isActiveAndEnabled);
        Debug.Log(enabled);
       // enabled = false;
        Debug.Log(name);
        Debug.Log(gameObject);
        Debug.Log(transform);

        Debug.Log("-------------------------");

        Debug.Log(cube.isActiveAndEnabled);
        Debug.Log(cube.enabled);
        cube.enabled = false;
        Debug.Log(cube.name);
        Debug.Log(cube.gameObject);
        Debug.Log(cube.transform);

    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
