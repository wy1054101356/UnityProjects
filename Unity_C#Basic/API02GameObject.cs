using System.Collections;
using System.Collections.Generic;
using UnityEngine;
//游戏构建 对象
public class API02GameObject : MonoBehaviour
{
    public GameObject Prefabs;
    public GameObject go;
    // Start is called before the first frame update
    void Start()
    {
        ////创建 对象的方法
        //GameObject cubeBox = new GameObject("Cube");

        ////第二种方法 克隆任意Object
        //GameObject.Instantiate(Prefabs);

        ////第三种 利用创建原始的形状、对象
        //go = GameObject.CreatePrimitive(PrimitiveType.Sphere);
        ////给游戏对象添加组件的方式
        //go.AddComponent<Rigidbody>(); //添加刚体
        //go.AddComponent<APIEvent>(); //添加自己写的脚本代码都可以

        ////设置对象的的激活状态
        //Debug.Log(go.activeInHierarchy);
        //go.SetActive(false);
        //Debug.Log(go.activeInHierarchy);
        //Debug.Log(go.tag);

        ////对象和对象的组件都从 gameObject继承而来， 组件本身是没有名字的
        ////所以 下面两个输出的结果是一样的 都是之前生成的Sphere
        //Debug.Log(go.name);
        //Debug.Log(go.GetComponent<Transform>().name);

        ////可以通过基类gameObject的静态方法 findObjectOfType 来找到泛型（你需要的）对象
        //Light light = GameObject.FindObjectOfType<Light>();
        ////enabled 和 active类似 enabled对组件的使用可否进行操作  active是对gameObject游戏对象
        //light.enabled =  false ;

        //对于每一个gameObject游戏对象 都存在他在场景中的坐标
        //因此，每一个游戏对象都有不可取消的组件 transform 
        //以下是查找游戏对象的所有 transform 并且不会查找未激活的对象
        //Transform[] ts = GameObject.FindObjectsOfType<Transform>();
        //foreach(Transform t in ts)
        //{
        //    Debug.Log(t);
        //    Debug.Log(t.name); //输出
        //获取到（激活的）每一个对象的名字 和对象本身名字

        //}

        //go = GameObject.Find("Main Camera");//通过find函数按对象名字进行查找
        //go.SetActive(false);

        //通过对象的标签获得
        //GameObject gameObject = GameObject.FindGameObjectWithTag("MainCamera");

        //if(gameObject != null)
        //{
        //    gameObject.SetActive(false);
        //}


    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
