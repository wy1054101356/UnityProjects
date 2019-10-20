// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:3,bdst:7,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32839,y:32359,varname:node_9361,prsc:2|custl-3031-RGB,alpha-3031-A;n:type:ShaderForge.SFN_Tex2d,id:3031,x:32532,y:32520,ptovrint:False,ptlb:node_3031,ptin:_node_3031,varname:node_3031,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:e8e347bcda0fb3242b524389342e7807,ntxv:0,isnm:False|UVIN-7346-UVOUT;n:type:ShaderForge.SFN_UVTile,id:7346,x:32361,y:32502,varname:node_7346,prsc:2|WDT-3737-OUT,HGT-1978-OUT,TILE-3850-OUT;n:type:ShaderForge.SFN_Vector1,id:3737,x:32127,y:32472,varname:node_3737,prsc:2,v1:8;n:type:ShaderForge.SFN_Vector1,id:1978,x:32127,y:32552,varname:node_1978,prsc:2,v1:-8;n:type:ShaderForge.SFN_Time,id:9608,x:32003,y:32627,varname:node_9608,prsc:2;n:type:ShaderForge.SFN_Trunc,id:3850,x:32361,y:32662,varname:node_3850,prsc:2|IN-584-OUT;n:type:ShaderForge.SFN_Slider,id:8984,x:31893,y:32805,ptovrint:False,ptlb:node_8984,ptin:_node_8984,varname:node_8984,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:16.6094,max:20;n:type:ShaderForge.SFN_Multiply,id:584,x:32193,y:32673,varname:node_584,prsc:2|A-9608-T,B-8984-OUT;proporder:3031-8984;pass:END;sub:END;*/

Shader "Shader Forge/AnimationShader" {
    Properties {
        _node_3031 ("node_3031", 2D) = "white" {}
        _node_8984 ("node_8984", Range(0, 20)) = 16.6094
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
            uniform sampler2D _node_3031; uniform float4 _node_3031_ST;
            uniform float _node_8984;
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
            float4 frag(VertexOutput i) : COLOR {
////// Lighting:
                float node_3737 = 8.0;
                float4 node_9608 = _Time;
                float node_3850 = trunc((node_9608.g*_node_8984));
                float2 node_7346_tc_rcp = float2(1.0,1.0)/float2( node_3737, (-8.0) );
                float node_7346_ty = floor(node_3850 * node_7346_tc_rcp.x);
                float node_7346_tx = node_3850 - node_3737 * node_7346_ty;
                float2 node_7346 = (i.uv0 + float2(node_7346_tx, node_7346_ty)) * node_7346_tc_rcp;
                float4 _node_3031_var = tex2D(_node_3031,TRANSFORM_TEX(node_7346, _node_3031));
                float3 finalColor = _node_3031_var.rgb;
                fixed4 finalRGBA = fixed4(finalColor,_node_3031_var.a);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
