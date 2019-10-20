//Shader 入门 https://blog.csdn.net/jianzuoguang/article/details/80471598
//有光照的 表面着色器 : https://catlikecoding.com/unity/tutorials/rendering/part-4/

//一个Unlit Shader(无光照着色器)如下:
Shader "Unlit/MyShader/Tutorial_Shader"{
	//通用属性 可以被调用 病显示在unity面板上的数据
	Properties{
		_Color("Totally Rad Color",Color) = (1,1,1,1)
		_MainTexture("Mian Texture",2D) = "white"{}
		_DissolveTexture("Dissolve Texture",2D) = "white"{}
		_DissolveCutoff("Dissolve Cutoff",Range(0,1)) = 0
		_ExtrudeAmount("Extrue Amount",float) = 0
	}
		//渲染管线
			SubShader{
			//一个管道  可以用多个
			Pass{
			//在这里处理所有CG
			CGPROGRAM
			#pragma vertex vertexFunction		//顶点函数
			#pragma fragment fragmentFunction	//片元函数
			#include "UnityCG.cginc"

			//一些自定义结构体 
			struct a2v {
				float4 vertex:POSITION;
				float2 uv:TEXCOORD0;
				float3 normal:NORMAL;
			};
			struct v2f {
				float4 position:SV_POSITION;
				float2 uv:TEXCOORD0;
			};


			float4 _Color;//获取在editor面板自定义的 颜色
			sampler2D _MainTexTure;
			sampler2D _DissolveTexture;	//2D 包含 法线 纹理贴图 UV坐标等
			float _DissolveCutoff;	//普通数值
			float _ExtrudeAmount;

			v2f vertexFunction(a2v v) {
				v2f o;
				v.vertex.xyz += v.normal.xyz * _ExtrudeAmount * sin(_Time.y); //顶点形变
				o.position = UnityObjectToClipPos(v.vertex);
				o.uv = v.uv;
				return o;
			}

			fixed4 fragmentFunction(v2f i) :SV_TARGET{
				//return tex2D(_MainTexTure,i.uv); //采样函数
				//现在能在片元函数中对溶解纹理采样：
				float4 textureColor = tex2D(_MainTexTure,i.uv);
				float4 dissolveColor = tex2D(_DissolveTexture,i.uv);
				clip(dissolveColor.rgb - _DissolveCutoff);
				//clip 函数检查这个给定的值是否小于0.如果小于0，我们将丢弃这个像素并且不绘制它。
				//如果大于0，继续保持像素、正常的渲染，我们的代码的工作方式如下： 
				//1. 对主纹理的颜色进行采样 
				//2. 对纹理颜色进行裁剪采样 
				//3. 从裁剪纹理中减去裁剪值 
				//4. 如果小于0，不进行绘制 
				//5. 否则，返回主纹理采样颜色
				//return textureColor;
				return textureColor * _Color;
			}

			ENDCG
		}
		}

}