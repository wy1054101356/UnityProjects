using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//简单的游戏事件
public class API03Event : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Debug.Log("start");
    }

    // Update is called once per frame
    void Update()
    {
        Debug.Log("update");
    }

    private void Reset()
    {
        print("reset");
    }

    private void OnEnable()
    {
        
    }
    private void Awake()
    {

    }

    private void OnRenderImage(RenderTexture source, RenderTexture destination)
    {
        
    }

    private void FixedUpdate()
    {
        
    }

    private void OnApplicationPause(bool pause)
    {
       // Debug.Log("pause");
    }
}
