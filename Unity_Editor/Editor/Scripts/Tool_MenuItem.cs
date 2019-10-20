using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class Tool_MenuItem
{
    //编辑器新建一个菜单 方法必须是静态的 路径可以放在Unity本地菜单中
    [MenuItem("Tools/1 - MenuItem/New A MenuItem1",false,1)]
    public static void NewAMenuItem1()
    {
        Debug.Log("点击了 新建一个菜单项1");
    }
    [MenuItem("Tools/1 - MenuItem/New A MenuItem2",false,2)]
    public static void NewAMenuItem2()
    {
        Debug.Log("点击了 新建一个菜单项2");
    }
    //在中间添加分类 第三个参数为优先顺序(大在上)
    //如果两个项的分类大于11 则会自动添加一个分类横线
    [MenuItem("Tools/2 - Classify/Classify1",false,101)]
    public static void Classify1()
    {
        Debug.Log("点击了 新建一个分类优先级1");
    }
    [MenuItem("Tools/3 - Classify/Classify2",false,100)]
    public static void Classify2()
    {
        Debug.Log("点击了 新建一个分类优先级2");
    }

    //在其他菜单自定义
    [MenuItem("GameObject/自定义面板菜单",false ,1)]
    public static void Gaaa()
    {
        Debug.Log("Gaaa");
    }

    //selection操纵
    [MenuItem("Tools/4 - Selection",false,200)]
    public static void SelectObject()
    {
        if (Selection.activeGameObject != null)
            Debug.Log("没有选中任何游戏物体");
        else
        {
            //输出在游戏(场景)面板中选择的项目 如果多选默认第一个
            Debug.Log(Selection.activeGameObject.name);
            //所有选中的集合 输出长度
            Debug.Log(Selection.gameObjects.Length);
        }
    }

    //添加菜单项的快捷键
    [MenuItem("Tools/5 - HotKey/HotKeyT _T", false,300)]
    public static void HotKeySetT()
    {
        Debug.Log("使用了快捷键 T");
    }
    [MenuItem("Tools/5 - HotKey/HotKeyCTRL+T _%T", false, 300)]
    public static void HotKeySetCTRL_T()
    {
        // %-> control #-> shift &-> alt
        Debug.Log("使用了组合快捷键 ctrl + T");
    }
    [MenuItem("Tools/5 - HotKey/HotKeyALT+T _&T", false, 300)]
    public static void HotKeySetATL_T()
    {
        // %-> control #->shift &alt
        Debug.Log("使用了组合快捷键 alt + T");
    }

    //菜单项是否能点击 第二个参数
    [MenuItem("GameObject/删除游戏物体", true, 1)]
    public static bool IsDeleteGO()
    {
        if (Selection.objects.Length > 0)
            return true;
        else
            return false;
    }

    [MenuItem("GameObject/删除游戏物体",false,1)]
    public static void DeleteGO()
    {
        foreach (Object item in Selection.objects)
        {
            //GameObject.Destroy(item); //不可撤销的删除
            Undo.DestroyObjectImmediate(item);//可以撤销
            //这个曹施写入到了 操作缓存中
        }
    }

}
