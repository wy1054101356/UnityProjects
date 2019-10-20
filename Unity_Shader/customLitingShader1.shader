// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:0,bsrc:0,bdst:1,dpts:2,wrdp:True,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:False,qofs:0,qpre:1,rntp:1,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:9361,x:33118,y:32181,varname:node_9361,prsc:2|normal-2586-RGB,custl-4852-OUT;n:type:ShaderForge.SFN_LightVector,id:9457,x:31698,y:32437,varname:node_9457,prsc:2;n:type:ShaderForge.SFN_NormalVector,id:5944,x:31716,y:32595,prsc:2,pt:True;n:type:ShaderForge.SFN_Dot,id:4458,x:32031,y:32492,varname:node_4458,prsc:2,dt:1|A-9457-OUT,B-5944-OUT;n:type:ShaderForge.SFN_RemapRange,id:7453,x:32407,y:32391,varname:node_7453,prsc:2,frmn:0,frmx:1,tomn:0.3,tomx:1|IN-4458-OUT;n:type:ShaderForge.SFN_Tex2d,id:3928,x:32101,y:32653,ptovrint:False,ptlb:node_3928,ptin:_node_3928,varname:_node_3928,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:b66bceaf0cc0ace4e9bdc92f14bba709,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Multiply,id:4047,x:32388,y:32592,varname:node_4047,prsc:2|A-4458-OUT,B-3928-RGB;n:type:ShaderForge.SFN_ViewVector,id:1020,x:31698,y:32257,varname:node_1020,prsc:2;n:type:ShaderForge.SFN_Add,id:6402,x:31985,y:32314,varname:node_6402,prsc:2|A-1020-OUT,B-9457-OUT;n:type:ShaderForge.SFN_Vector1,id:7854,x:31985,y:32191,varname:node_7854,prsc:2,v1:0.5;n:type:ShaderForge.SFN_Multiply,id:9134,x:32228,y:32224,varname:node_9134,prsc:2|A-7854-OUT,B-6402-OUT;n:type:ShaderForge.SFN_HalfVector,id:7725,x:31697,y:32750,varname:node_7725,prsc:2;n:type:ShaderForge.SFN_Dot,id:1153,x:31941,y:32740,varname:node_1153,prsc:2,dt:1|A-5944-OUT,B-7725-OUT;n:type:ShaderForge.SFN_Power,id:8223,x:32277,y:32907,varname:node_8223,prsc:2|VAL-1153-OUT,EXP-8477-OUT;n:type:ShaderForge.SFN_Exp,id:8477,x:32003,y:32943,varname:node_8477,prsc:2,et:1|IN-3362-OUT;n:type:ShaderForge.SFN_Slider,id:3362,x:31664,y:32956,ptovrint:False,ptlb:node_3362,ptin:_node_3362,varname:node_3362,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,min:0,cur:1.502806,max:10;n:type:ShaderForge.SFN_Add,id:9219,x:32525,y:32770,varname:node_9219,prsc:2|A-8223-OUT,B-4047-OUT;n:type:ShaderForge.SFN_Desaturate,id:1788,x:32277,y:32736,varname:node_1788,prsc:2|COL-3928-RGB;n:type:ShaderForge.SFN_RemapRange,id:289,x:32481,y:32948,varname:node_289,prsc:2,frmn:0,frmx:1,tomn:-1,tomx:1|IN-1788-OUT;n:type:ShaderForge.SFN_Clamp01,id:9022,x:32692,y:32948,varname:node_9022,prsc:2|IN-289-OUT;n:type:ShaderForge.SFN_Multiply,id:4852,x:32879,y:32853,varname:node_4852,prsc:2|A-9219-OUT,B-9022-OUT;n:type:ShaderForge.SFN_Tex2d,id:2586,x:32615,y:32185,ptovrint:False,ptlb:node_2586,ptin:_node_2586,varname:node_2586,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:c6dfb00dbee6bc044a8a3bb22e56e064,ntxv:3,isnm:True;proporder:3928-3362-2586;pass:END;sub:END;*/

Shader "Shader Forge/customLitingShader1" {
    Properties {
        _node_3928 ("node_3928", 2D) = "white" {}
        _node_3362 ("node_3362", Range(0, 10)) = 1.502806
        _node_2586 ("node_2586", 2D) = "bump" {}
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
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdbase_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_3928; uniform float4 _node_3928_ST;
            uniform float _node_3362;
            uniform sampler2D _node_2586; uniform float4 _node_2586_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_2586_var = UnpackNormal(tex2D(_node_2586,TRANSFORM_TEX(i.uv0, _node_2586)));
                float3 normalLocal = _node_2586_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(_WorldSpaceLightPos0.xyz);
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float node_4458 = max(0,dot(lightDirection,normalDirection));
                float4 _node_3928_var = tex2D(_node_3928,TRANSFORM_TEX(i.uv0, _node_3928));
                float3 finalColor = ((pow(max(0,dot(normalDirection,halfDirection)),exp2(_node_3362))+(node_4458*_node_3928_var.rgb))*saturate((dot(_node_3928_var.rgb,float3(0.3,0.59,0.11))*2.0+-1.0)));
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "FORWARD_DELTA"
            Tags {
                "LightMode"="ForwardAdd"
            }
            Blend One One
            
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDADD
            #include "UnityCG.cginc"
            #include "AutoLight.cginc"
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles 
            #pragma target 3.0
            uniform sampler2D _node_3928; uniform float4 _node_3928_ST;
            uniform float _node_3362;
            uniform sampler2D _node_2586; uniform float4 _node_2586_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float2 texcoord0 : TEXCOORD0;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 posWorld : TEXCOORD1;
                float3 normalDir : TEXCOORD2;
                float3 tangentDir : TEXCOORD3;
                float3 bitangentDir : TEXCOORD4;
                LIGHTING_COORDS(5,6)
                UNITY_FOG_COORDS(7)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.normalDir = UnityObjectToWorldNormal(v.normal);
                o.tangentDir = normalize( mul( unity_ObjectToWorld, float4( v.tangent.xyz, 0.0 ) ).xyz );
                o.bitangentDir = normalize(cross(o.normalDir, o.tangentDir) * v.tangent.w);
                o.posWorld = mul(unity_ObjectToWorld, v.vertex);
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                TRANSFER_VERTEX_TO_FRAGMENT(o)
                return o;
            }
            float4 frag(VertexOutput i) : COLOR {
                i.normalDir = normalize(i.normalDir);
                float3x3 tangentTransform = float3x3( i.tangentDir, i.bitangentDir, i.normalDir);
                float3 viewDirection = normalize(_WorldSpaceCameraPos.xyz - i.posWorld.xyz);
                float3 _node_2586_var = UnpackNormal(tex2D(_node_2586,TRANSFORM_TEX(i.uv0, _node_2586)));
                float3 normalLocal = _node_2586_var.rgb;
                float3 normalDirection = normalize(mul( normalLocal, tangentTransform )); // Perturbed normals
                float3 lightDirection = normalize(lerp(_WorldSpaceLightPos0.xyz, _WorldSpaceLightPos0.xyz - i.posWorld.xyz,_WorldSpaceLightPos0.w));
                float3 halfDirection = normalize(viewDirection+lightDirection);
////// Lighting:
                float node_4458 = max(0,dot(lightDirection,normalDirection));
                float4 _node_3928_var = tex2D(_node_3928,TRANSFORM_TEX(i.uv0, _node_3928));
                float3 finalColor = ((pow(max(0,dot(normalDirection,halfDirection)),exp2(_node_3362))+(node_4458*_node_3928_var.rgb))*saturate((dot(_node_3928_var.rgb,float3(0.3,0.59,0.11))*2.0+-1.0)));
                fixed4 finalRGBA = fixed4(finalColor * 1,0);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
