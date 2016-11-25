//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 fragCoord;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
    
    fragCoord = in_Position.xy;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

varying vec2 fragCoord;

uniform vec3      iResolution;           // viewport resolution (in pixels)
uniform float     iGlobalTime;           // shader playback time (in seconds)

uniform sampler2D tex_water;

// Jason Allen Doucette
// http://xona.com/jason/
//
// Quake-style Underwater Distortion
// May 15, 2016

#define speed 2.0

// the amount of shearing (shifting of a single column or row)
// 1.0 = entire screen height offset (to both sides, meaning it's 2.0 in total)
#define xDistMag 0.05
#define yDistMag 0.05

// cycle multiplier for a given screen height
// 2*PI = you see a complete sine wave from top..bottom
#define xSineCycles 6.28
#define ySineCycles 6.28


// ---- CODE ----------------------------------------------------------------

void main(){
    
    vec2 uv = vec2(fragCoord.x, fragCoord.y);    

    // isotropic scaling, ensuring entire texture fits into the view.
    float minRes = min (iResolution.x, iResolution.y);

    // do the scaling.
    // After this, you should consider fragCoord = 0..1, usually,
    // aside from overflow for wide-screen.
    uv /= minRes;

    
    // the value for the sine has 2 inputs:
    // 1. the time, so that it animates.
    // 2. the y-row, so that ALL scanlines do not distort equally.
    float time = iGlobalTime*speed;
    float xAngle = time + fragCoord.y * ySineCycles;
    float yAngle = time + fragCoord.x * xSineCycles;
    
    vec2 distortOffset = 
    vec2(sin(xAngle), sin(yAngle)) * // amount of shearing
    vec2(xDistMag,yDistMag); // magnitude adjustment
    
    // shear the coordinates
    uv += distortOffset;    
    
    // grab the color
    // variable texture for demonstration purposes.    
    
    gl_FragColor = texture2D(tex_water, uv);

}
