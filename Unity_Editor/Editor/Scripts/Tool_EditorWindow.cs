using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class Tool_EditorWindow : EditorWindow
{
    //打开自定义窗口的的菜单项
    [MenuItem("Tools/7 - EditorWindow")]
    public static void NewEditorWindow()
    {
        // 创建一个自定义窗口
        Tool_EditorWindow myWindow = EditorWindow.GetWindow<Tool_EditorWindow>();
        myWindow.Show();//显示窗口
    }

    private string gameObjectName = "";


    //绘制窗口内容 固有方法
    private void OnGUI()
    {
        // 用GUI创建一行文字
        GUILayout.Label("当前窗口用来增加自定义游戏物体\n");
        // 设置一个可返回输入内容的文本行
        gameObjectName = GUILayout.TextField(gameObjectName);

        // 设置一个按钮 并响应
        if (GUILayout.Button("创建游戏物体"))
        {
            if (gameObjectName == "" || gameObjectName == null)
            {
                //弹窗提醒 几秒后自动消失
                ShowNotification(new GUIContent("游戏物体名字不能为空"));
            }
            else
            {
                GameObject go = new GameObject(gameObjectName);
                Undo.RegisterCreatedObjectUndo(go, "craete a gameObject[" + go.name + "]");
            }
        }

        if (GUILayout.Button("创建游戏物体"))
        {
            GameObject go = GameObject.Find(gameObjectName);
            if (go != null)
            {
                if(!go.GetComponent<Rigidbody>())
                {
                    go.AddComponent<Rigidbody>();
                }
                else
                {
                    ShowNotification(new GUIContent("当前游戏物体已存在刚体组件"));
                }
            }
            else
            {
                ShowNotification(new GUIContent("未找到当前名字的游戏物体"));
            }
        }
    }

}
