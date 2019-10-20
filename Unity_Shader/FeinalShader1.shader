// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:32344,y:32517,varname:node_9361,prsc:2|custl-7285-OUT;n:type:ShaderForge.SFN_Fresnel,id:1335,x:31670,y:32495,varname:node_1335,prsc:2|NRM-8439-OUT,EXP-7492-OUT;n:type:ShaderForge.SFN_NormalVector,id:8439,x:31427,y:32321,prsc:2,pt:False;n:type:ShaderForge.SFN_Slider,id:7492,x:31382,y:32676,ptovrint:False,ptlb:node_7492,ptin:_node_7492,varname:node_7492,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.375563,max:3;n:type:ShaderForge.SFN_Color,id:169,x:31723,y:32642,ptovrint:False,ptlb:node_169,ptin:_node_169,varname:node_169,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.6862745,c2:0.572549,c3:0.5254902,c4:1;n:type:ShaderForge.SFN_Multiply,id:8293,x:31958,y:32705,varname:node_8293,prsc:2|A-1335-OUT,B-169-RGB,C-2483-OUT;n:type:ShaderForge.SFN_Tex2d,id:6717,x:31930,y:32529,ptovrint:False,ptlb:node_6717,ptin:_node_6717,varname:node_6717,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Add,id:7285,x:32144,y:32620,varname:node_7285,prsc:2|A-6717-RGB,B-8293-OUT;n:type:ShaderForge.SFN_Slider,id:2483,x:31644,y:32919,ptovrint:False,ptlb:node_2483,ptin:_node_2483,varname:node_2483,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.150288,max:10;n:type:ShaderForge.SFN_ViewVector,id:6162,x:31427,y:32177,varname:node_6162,prsc:2;n:type:ShaderForge.SFN_Dot,id:8652,x:31670,y:32236,varname:node_8652,prsc:2,dt:1|A-6162-OUT,B-8439-OUT;n:type:ShaderForge.SFN_OneMinus,id:150,x:31857,y:32236,varname:node_150,prsc:2|IN-8652-OUT;proporder:7492-169-6717-2483;pass:END;sub:END;*/

Shader "Shader Forge/FeinalShader1" {
    Properties {
        _node_7492 ("node_7492", Range(0, 3)) = 1.375563
        _node_169 ("node_169", Color) = (0.6862745,0.572549,0.5254902,1)
        _node_6717 ("node_6717", 2D) = "white" {}
        _node_2483 ("node_2483", Range(0, 10)) = 1.150288
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
            uniform float _node_7492;
            uniform float4 _node_169;
            uniform sampler2D _node_6717; uniform float4 _node_6717_ST;
            uniform float _node_2483;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                UNITY_FOG_COORDS(3)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 normalDirection = i.normalDir;
////// Lighting:
                float4 _node_6717_var = tex2D(_node_6717,TRANSFORM_TEX(i.uv0, _node_6717));
                float3 finalColor = (_node_6717_var.rgb+(pow(1.0-max(0,dot(i.normalDir, viewDirection)),_node_7492)*_node_169.rgb*_node_2483));
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
