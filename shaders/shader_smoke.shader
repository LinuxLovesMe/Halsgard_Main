 uniform mat4 u_modelViewProjectionMatrix;
 uniform float maxBlurSizeConstant;  // experiment with value and it will be based on the scale of the render

 attribute vec3 a_vertexPosition;
 attribute vec2 a_vertexTexCoord0;
 attribute float a_decay;

 varying float v_decay;
 varying vec2 v_fragmentTexCoord0;
 varying vec2 v_texCoord1;
 varying vec2 v_texCoord2;
 varying vec2 v_texCoord3;
 varying vec2 v_texCoord4;
 varying vec2 v_texCoordM1;
 varying vec2 v_texCoordM2;
 varying vec2 v_texCoordM3;
 varying vec2 v_texCoordM4;

 void main()
 {
    gl_Position = u_modelViewProjectionMatrix * vec4(a_vertexPosition,1.0);

    v_decay = a_decay;

    float angle = 2.8 - a_decay * 0.8;  // just an example of angles

    vec2 tOffset = vec2(cos(angle),sin(angle)) * maxBlurSizeConstant * a_decay;

    v_fragmentTexCoord0 = a_vertexTexCoord0;

    v_texCoordM1 = a_vertexTexCoord0 - tOffset;
    v_texCoordM2 = a_vertexTexCoord0 - 2.0 * tOffset;
    v_texCoordM3 = a_vertexTexCoord0 - 3.0 * tOffset;
    v_texCoordM4 = a_vertexTexCoord0 - 4.0 * tOffset;
    v_texCoord1 = a_vertexTexCoord0 + tOffset;
    v_texCoord2 = a_vertexTexCoord0 + 2.0 * tOffset;
    v_texCoord3 = a_vertexTexCoord0 + 3.0 * tOffset;
    v_texCoord4 = a_vertexTexCoord0 + 4.0 * tOffset;
 }
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

