using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class API09onmouseevent : MonoBehaviour
{
    private void OnMouseDown()
    {
        print("Down");
    }

    private void OnMouseUp()
    {
        print("Up");
    }

    private void OnMouseDrag()
    {
        print("Drag");
    }

    private void OnMouseEnter()
    {
        print("Enter");
    }

    private void OnMouseExit()
    {
        print("Exit");
    }


    private void OnMouseOver()
    {
        print("over");
    }

    private void OnMouseUpAsButton()
    {
        //当鼠标按下和松开都在同同一个游戏对象上才会触发的方法
        print("UpAsButton"+gameObject);
    }
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
