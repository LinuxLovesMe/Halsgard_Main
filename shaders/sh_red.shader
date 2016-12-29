//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.	
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

float i = 0.0;
vec4 colour = texture2D(gm_BaseTexture, v_vTexcoord);
float intensity = 0.299 * colour.r + 0.587 * colour.g + 0.184 * colour.b;

uniform float m;

void main()
{
    
    for(i = 1.0; i > 0.0; i -= m)
    {
        if(intensity > i)
        {
            colour = vec4(1.0 * i, 0.0, 0.0,
                texture2D(gm_BaseTexture, v_vTexcoord).a);
            break;
        }else
        {
           colour = vec4(0.0, 0.0, 0.0,
                texture2D(gm_BaseTexture, v_vTexcoord).a);   
        }
    }
    gl_FragColor = colour;
}

