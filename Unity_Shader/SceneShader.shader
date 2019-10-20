// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:1,hqsc:True,nrmq:1,nrsp:0,vomd:1,spxs:False,tesm:0,olmd:1,culm:2,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33637,y:32812,varname:node_9361,prsc:2|custl-1916-OUT,alpha-1728-OUT,voffset-2103-OUT;n:type:ShaderForge.SFN_Color,id:766,x:32975,y:32738,ptovrint:False,ptlb:node_766,ptin:_node_766,varname:node_766,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0.2941176,c3:0.2941176,c4:1;n:type:ShaderForge.SFN_RemapRange,id:2103,x:32862,y:33205,varname:node_2103,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-6797-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6797,x:32538,y:33243,varname:node_6797,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_ComponentMask,id:7631,x:32700,y:33021,varname:node_7631,prsc:2,cc1:0,cc2:1,cc3:-1,cc4:-1|IN-2103-OUT;n:type:ShaderForge.SFN_ArcTan2,id:3767,x:32789,y:32859,varname:node_3767,prsc:2,attp:3|A-7631-R,B-7631-G;n:type:ShaderForge.SFN_Append,id:5345,x:32974,y:33030,varname:node_5345,prsc:2|A-3767-OUT,B-3767-OUT;n:type:ShaderForge.SFN_Tex2d,id:8557,x:33285,y:33012,ptovrint:False,ptlb:node_8557,ptin:_node_8557,varname:node_8557,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:f83e6b3e5a2284749ae61711642ea3fa,ntxv:0,isnm:False|UVIN-4643-UVOUT;n:type:ShaderForge.SFN_Multiply,id:1916,x:33426,y:32774,varname:node_1916,prsc:2|A-766-RGB,B-8557-RGB;n:type:ShaderForge.SFN_Rotator,id:4643,x:33147,y:32880,varname:node_4643,prsc:2|UVIN-5345-OUT;n:type:ShaderForge.SFN_Distance,id:2842,x:32919,y:33368,varname:node_2842,prsc:2|A-6797-UVOUT,B-5494-OUT;n:type:ShaderForge.SFN_Vector2,id:5494,x:32538,y:33417,varname:node_5494,prsc:2,v1:0.5,v2:0.5;n:type:ShaderForge.SFN_Slider,id:2894,x:32677,y:33518,ptovrint:False,ptlb:node_2894,ptin:_node_2894,varname:node_2894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:2.020562,max:4;n:type:ShaderForge.SFN_Exp,id:464,x:33108,y:33467,varname:node_464,prsc:2,et:1|IN-2894-OUT;n:type:ShaderForge.SFN_Power,id:2118,x:33303,y:33381,varname:node_2118,prsc:2|VAL-8308-OUT,EXP-464-OUT;n:type:ShaderForge.SFN_Clamp01,id:1728,x:33512,y:33313,varname:node_1728,prsc:2|IN-2118-OUT;n:type:ShaderForge.SFN_RemapRange,id:8308,x:33085,y:33256,varname:node_8308,prsc:2,frmn:0,frmx:0.5,tomn:0,tomx:0.7|IN-2842-OUT;proporder:766-8557-2894;pass:END;sub:END;*/

Shader "Shader Forge/SceneShader" {
    Properties {
        _node_766 ("node_766", Color) = (1,0.2941176,0.2941176,1)
        _node_8557 ("node_8557", 2D) = "white" {}
        _node_2894 ("node_2894", Range(0, 4)) = 2.020562
        [HideInInspector]_Cutoff ("Alpha cutoff", Range(0,1)) = 0.5
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend SrcAlpha OneMinusSrcAlpha
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform float4 _node_766;
            uniform sampler2D _node_8557; uniform float4 _node_8557_ST;
            uniform float _node_2894;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float2 node_2103 = (o.uv0*2.0+-1.0);
                v.vertex.xyz = float3(node_2103,0.0);
                o.pos = v.vertex;
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_5522 = _Time;
                float node_4643_ang = node_5522.g;
                float node_4643_spd = 1.0;
                float node_4643_cos = cos(node_4643_spd*node_4643_ang);
                float node_4643_sin = sin(node_4643_spd*node_4643_ang);
                float2 node_4643_piv = float2(0.5,0.5);
                float2 node_2103 = (i.uv0*2.0+-1.0);
                float2 node_7631 = node_2103.rg;
                float node_3767 = (1-abs(atan2(node_7631.r,node_7631.g)/3.14159265359));
                float2 node_4643 = (mul(float2(node_3767,node_3767)-node_4643_piv,float2x2( node_4643_cos, -node_4643_sin, node_4643_sin, node_4643_cos))+node_4643_piv);
                float4 _node_8557_var = tex2D(_node_8557,TRANSFORM_TEX(node_4643, _node_8557));
                float3 finalColor = (_node_766.rgb*_node_8557_var.rgb);
                float node_2842 = distance(i.uv0,float2(0.5,0.5));
                fixed4 finalRGBA = fixed4(finalColor,saturate(pow((node_2842*1.4+0.0),exp2(_node_2894))));
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
                float2 uv0 : TEXCOORD1;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                float2 node_2103 = (o.uv0*2.0+-1.0);
                v.vertex.xyz = float3(node_2103,0.0);
                o.pos = v.vertex;
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
