using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//游戏对象的组件
public class API05Component : MonoBehaviour
{
    public GameObject target;
    // Start is called before the first frame update
    void Start()
    {
        Cube cube = target.GetComponent<Cube>();
        Transform transform = target.GetComponent<Transform>();
        Debug.Log(cube);
        Debug.Log(transform);
        Debug.Log("--------------------------------");

        Cube[] cubes = target.GetComponents<Cube>();
        Transform[] transforms = target.GetComponents<Transform>();
        Debug.Log(cubes.Length);
        Debug.Log("--------------------------------");

        cubes = target.GetComponentsInChildren<Cube>();
        foreach(Cube cb in cubes)
        {
            Debug.Log(cb);
        }
        Debug.Log("--------------------------------");
        cubes = target.GetComponentsInParent<Cube>();
        foreach (Cube cb in cubes)
        {
            Debug.Log(cb);
        }
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
