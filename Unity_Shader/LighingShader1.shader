// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33031,y:32390,varname:node_9361,prsc:2|custl-6500-OUT;n:type:ShaderForge.SFN_Tex2d,id:9604,x:32465,y:32243,ptovrint:False,ptlb:node_9604,ptin:_node_9604,varname:node_9604,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:600624ded2b17344aa5b8e68f36b1837,ntxv:0,isnm:False|UVIN-7282-UVOUT;n:type:ShaderForge.SFN_Panner,id:7282,x:32241,y:32243,varname:node_7282,prsc:2,spu:0.3,spv:0|UVIN-2781-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:2781,x:31956,y:32243,varname:node_2781,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Tex2d,id:2110,x:32465,y:32411,ptovrint:False,ptlb:node_9604_copy,ptin:_node_9604_copy,varname:_node_9604_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:1af45cacbc75a3245b2546bbd8079c97,ntxv:0,isnm:False|UVIN-9390-UVOUT;n:type:ShaderForge.SFN_Panner,id:9390,x:32241,y:32411,varname:node_9390,prsc:2,spu:0,spv:0.2|UVIN-2781-UVOUT;n:type:ShaderForge.SFN_Add,id:5779,x:32655,y:32327,varname:node_5779,prsc:2|A-9604-RGB,B-2110-RGB;n:type:ShaderForge.SFN_Color,id:5296,x:32655,y:32144,ptovrint:False,ptlb:node_5296,ptin:_node_5296,varname:node_5296,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:0,c3:0,c4:1;n:type:ShaderForge.SFN_Multiply,id:6500,x:32868,y:32286,varname:node_6500,prsc:2|A-5296-RGB,B-5779-OUT;proporder:9604-2110-5296;pass:END;sub:END;*/

Shader "Shader Forge/LighingShader1" {
    Properties {
        _node_9604 ("node_9604", 2D) = "white" {}
        _node_9604_copy ("node_9604_copy", 2D) = "white" {}
        [HDR]_node_5296 ("node_5296", Color) = (1,0,0,1)
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
            Blend One One
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
            uniform sampler2D _node_9604; uniform float4 _node_9604_ST;
            uniform sampler2D _node_9604_copy; uniform float4 _node_9604_copy_ST;
            uniform float4 _node_5296;
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
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
                float4 node_6351 = _Time;
                float2 node_7282 = (i.uv0+node_6351.g*float2(0.3,0));
                float4 _node_9604_var = tex2D(_node_9604,TRANSFORM_TEX(node_7282, _node_9604));
                float2 node_9390 = (i.uv0+node_6351.g*float2(0,0.2));
                float4 _node_9604_copy_var = tex2D(_node_9604_copy,TRANSFORM_TEX(node_9390, _node_9604_copy));
                float3 finalColor = (_node_5296.rgb*(_node_9604_var.rgb+_node_9604_copy_var.rgb));
                fixed4 finalRGBA = fixed4(finalColor,1);
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
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
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
