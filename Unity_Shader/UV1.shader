// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33255,y:32324,varname:node_9361,prsc:2|custl-7354-RGB;n:type:ShaderForge.SFN_Tex2d,id:7354,x:32999,y:32274,ptovrint:False,ptlb:node_7354,ptin:_node_7354,varname:node_7354,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:7d1c1adfd77b3c743bb7973ac33d4f88,ntxv:0,isnm:False|UVIN-7678-OUT;n:type:ShaderForge.SFN_TexCoord,id:9420,x:32188,y:32415,varname:node_9420,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:4968,x:32494,y:32259,varname:node_4968,prsc:2,spu:0,spv:1|UVIN-9420-UVOUT;n:type:ShaderForge.SFN_ValueProperty,id:2522,x:32198,y:32843,ptovrint:False,ptlb:USpeed,ptin:_USpeed,varname:node_2522,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_ValueProperty,id:6004,x:32213,y:32604,ptovrint:False,ptlb:VSpeed,ptin:_VSpeed,varname:_v_2,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,v1:0.5;n:type:ShaderForge.SFN_Time,id:6665,x:32198,y:32684,varname:node_6665,prsc:2;n:type:ShaderForge.SFN_Multiply,id:7624,x:32410,y:32626,varname:node_7624,prsc:2|A-6004-OUT,B-6665-T;n:type:ShaderForge.SFN_Multiply,id:302,x:32410,y:32791,varname:node_302,prsc:2|A-6665-T,B-2522-OUT;n:type:ShaderForge.SFN_Append,id:628,x:32581,y:32747,varname:node_628,prsc:2|A-7624-OUT,B-302-OUT;n:type:ShaderForge.SFN_Add,id:7953,x:32581,y:32583,varname:node_7953,prsc:2|A-9420-UVOUT,B-628-OUT;n:type:ShaderForge.SFN_Tex2d,id:2343,x:32777,y:32774,ptovrint:False,ptlb:node_2343,ptin:_node_2343,varname:node_2343,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:37cf3598abfc911459f3d78d5f0d751a,ntxv:0,isnm:False|UVIN-7953-OUT;n:type:ShaderForge.SFN_Add,id:7678,x:32895,y:32466,varname:node_7678,prsc:2|A-9420-UVOUT,B-8529-OUT;n:type:ShaderForge.SFN_Append,id:934,x:32950,y:32805,varname:node_934,prsc:2|A-2343-R,B-2343-R;n:type:ShaderForge.SFN_Multiply,id:8529,x:33228,y:32891,varname:node_8529,prsc:2|A-934-OUT,B-9169-OUT;n:type:ShaderForge.SFN_Slider,id:9169,x:32857,y:32985,ptovrint:False,ptlb:node_9169,ptin:_node_9169,varname:node_9169,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:0.1858359,max:1;proporder:7354-2522-6004-2343-9169;pass:END;sub:END;*/

Shader "Shader Forge/UV1" {
    Properties {
        _node_7354 ("node_7354", 2D) = "white" {}
        _USpeed ("USpeed", Float ) = 0.5
        _VSpeed ("VSpeed", Float ) = 0.5
        _node_2343 ("node_2343", 2D) = "white" {}
        _node_9169 ("node_9169", Range(0, 1)) = 0.1858359
    }
    SubShader {
        Tags {
            "RenderType"="Opaque"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_7354; uniform float4 _node_7354_ST;
            uniform float _USpeed;
            uniform float _VSpeed;
            uniform sampler2D _node_2343; uniform float4 _node_2343_ST;
            uniform float _node_9169;
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
                float4 node_6665 = _Time;
                float2 node_7953 = (i.uv0+float2((_VSpeed*node_6665.g),(node_6665.g*_USpeed)));
                float4 _node_2343_var = tex2D(_node_2343,TRANSFORM_TEX(node_7953, _node_2343));
                float2 node_7678 = (i.uv0+(float2(_node_2343_var.r,_node_2343_var.r)*_node_9169));
                float4 _node_7354_var = tex2D(_node_7354,TRANSFORM_TEX(node_7678, _node_7354));
                float3 finalColor = _node_7354_var.rgb;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
