using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class Tool_Player
{
    //给固定的菜单添加菜单项
    //这里给 PlayerHealth 组件 右键菜单添加了一项
    [MenuItem("CONTEXT/PlayerHealth/初始化人物属性")]
    public static void InithealthAndSpeed(MenuCommand mcd)
    {
        //MenuCommand mcd中的context 是当前操作的组件对象 是一个Component
        CompleteProject.PlayerHealth ph = mcd.context as CompleteProject.PlayerHealth;

        if(ph != null)
        {
            ph.startingHealth = 150;
            ph.flashSpeed = 20;
        }

        Debug.Log("初始化人物属性");
    }


    [MenuItem("CONTEXT/Rigidbody/清除重力")]
    public static void ClearMassAndGravity(MenuCommand mcd)
    {
        Rigidbody rigidbody = mcd.context as Rigidbody;
        if(rigidbody != null)
        {
            rigidbody.mass = 0.1f;//设置质量为0
            rigidbody.useGravity = false; //不使用重力
        }

        Debug.Log("操作了 RIgiBody 组件 并清除重力");
    }
}
