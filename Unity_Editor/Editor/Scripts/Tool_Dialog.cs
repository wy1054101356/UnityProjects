using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEditor;

public class Tool_Dialog : ScriptableWizard
{

    //打开对话框的菜单项
    [MenuItem("Tools/6 - ChangeHealthDialog")]
    public static void ChangeHealthDialog()
    {
        ScriptableWizard.DisplayWizard<Tool_Dialog>("统一修改敌人参数","关闭窗口","修改数值");
    }

    public int changeStartHealthValue = 10;
    public int changeSinkSpeedValue = 1;


    // 当弹窗创建的时候被调用
    private void OnEnable()
    {
        //从之前的值读取并 写入新的弹窗字段数据
        changeStartHealthValue = EditorPrefs.GetInt("Tool_Dialog.changeStartHealthValue");
        changeSinkSpeedValue = EditorPrefs.GetInt("Tool_Dialog.changeSinkSpeedValue");
    }


    public void ChangeHealthAndSpeed()
    {
        //获取所有选中的GameObject 
        GameObject[] selectedPrefabs = Selection.gameObjects;

        //添加一个修改进度条 0-1的百分百进度
        EditorUtility.DisplayProgressBar("修改进度", "0 / " + selectedPrefabs.Length + "完成修改值", 0);
        foreach (var item in selectedPrefabs)
        {
            CompleteProject.EnemyHealth enemyHealthItem = item.GetComponent<CompleteProject.EnemyHealth>();
            //记录上面的修改 第二个参数是一个名字 可撤回这次修改
            Undo.RecordObject(enemyHealthItem, item.name + "has changed health and speed successfully");
            enemyHealthItem.startingHealth += changeStartHealthValue;
            enemyHealthItem.sinkSpeed += changeSinkSpeedValue;
        }

        for (float i = 0; i <= 1000; i++)
        {
            EditorUtility.DisplayProgressBar("修改进度", i + " / " + 1000,(float)i / 1000);
        }

        //显示提示信息 提示信息需要封装到GUI中
        ShowNotification(new GUIContent("修改了 " + selectedPrefabs.Length + " 个预设的参数"));

    }

    public void ShowEnemyHealthInfo()
    {
        GameObject[] selectedPrefabs = Selection.gameObjects;
        foreach (var item in selectedPrefabs)
        {
            CompleteProject.EnemyHealth enemyHealthItem = item.GetComponent<CompleteProject.EnemyHealth>();
            Debug.Log(item.name + " - health:" + enemyHealthItem.startingHealth);
            Debug.Log(item.name + " - speed :" + enemyHealthItem.sinkSpeed);
        }
    }

    //自带的 固有方法 每次字段更新调用
    private void OnWizardUpdate()
    {
        if (Selection.gameObjects.Length > 0)
        {
            //修改 帮助信息
            helpString = "您选择了" + Selection.gameObjects.Length + "个敌人";
            errorString = "";
        }
        else
        {
            //修改 错误信息
            errorString = "你未能选择任何游戏物体";
            helpString = "";
        }

        // 每次字段被修改后 保存在弹窗中修改的值
        EditorPrefs.SetInt("Tool_Dialog.changeStartHealthValue", changeStartHealthValue);
        EditorPrefs.SetInt("Tool_Dialog.changeSinkSpeedValue", changeSinkSpeedValue);
    }
    // 选择物体发生了改变的时候调用
    private void OnSelectionChange()
    {
        OnWizardUpdate();
    }
    // 固有函数 当点击按钮进行操作
    private void OnWizardCreate()
    {
        Debug.Log("点击了Crete按钮");
    }

    //响应其他按钮的操作
    private void OnWizardOtherButton()
    {
        Debug.Log("响应其他按钮");
        ShowEnemyHealthInfo();
        ChangeHealthAndSpeed();
        ShowEnemyHealthInfo();
    }
}