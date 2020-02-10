sce1.0

# camera
eyepos 750 75 150
eyedir -0.2 1.0 0.3
eyeup  0.0 0.0 1.0
wdist  20.0
fovy_deg 70

nx 1280
ny 640

#options

max_recursion 8
aasample 2
                
# scene

ca 0.1 0.1 0.1

background 0 0 0

{
        # cylinder cube frame around bottom plane
        cr 0.8 0.0 0.8
        cp 0.1 0.0 0.1
        shininess 10.0
 
        push_matrix
          rotate 90.0 1.0 0.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          rotate 90.0 0.0 1.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 1000.0 0.0
          rotate -90.0 0.0 1.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 1000.0 0.0
          rotate -90.0 1.0 0.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

}

{
        # cylinder cube frame around top plane
        cr 0.8 0.0 0.8
        cp 0.1 0.0 0.1
        shininess 10.0
 
        push_matrix
        translate 0.0 0.0 1000.0

          push_matrix
            rotate 90.0 1.0 0.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix

          push_matrix
            rotate 90.0 0.0 1.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix

          push_matrix
            translate 1000.0 1000.0 0.0
            rotate -90.0 0.0 1.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix

          push_matrix
            translate 1000.0 1000.0 0.0
            rotate -90.0 1.0 0.0 0.0
            scale 35.0 35.0 1000.0
            cylinder 
          pop_matrix
        pop_matrix
}

{
        # cylinder cube frame vertically around box
        cr 0.8 0.0 0.8
        cp 0.1 0.0 0.1
        shininess 10.0
 
        push_matrix
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 0.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 0.0 1000.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix

        push_matrix
          translate 1000.0 1000.0 0.0
          scale 35.0 35.0 1000.0
          cylinder 
        pop_matrix
}

{
        #bottom
        ca 0.4 0.2 0.2
        cr 0.7 0.4 0.4
        cp 1.0 1.0 1.0
        shininess 100.0
 
        triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
        triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
}

{
        #top
        push_matrix
          translate 0.0 0.0 1000.0

          ca 0.4 0.2 0.2
          cr 0.7 0.4 0.4
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #left
        push_matrix
          rotate -90.0 0.0 1.0 0.0

          ca 0.2 0.4 0.2
          cr 0.4 0.7 0.4
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #right
        push_matrix
          translate 1000.0 0.0 0.0
          rotate -90.0 0.0 1.0 0.0

          ca 0.2 0.4 0.2
          cr 0.4 0.7 0.4
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #front
        push_matrix
          rotate 90.0 1.0 0.0 0.0

          ca 0.2 0.2 0.4
          cr 0.4 0.4 0.7
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        #back
        push_matrix
          translate 0.0 1000.0 0.0
          rotate 90.0 1.0 0.0 0.0

          ca 0.2 0.2 0.4
          cr 0.4 0.4 0.7
          cp 1.0 1.0 1.0
          shininess 100.0
 
          triangle 0.0 0.0 0.0  0.0 1000.0 0.0  1000.0 0.0 0.0
          triangle 0.0 1000.0 0.0  1000.0 1000.0 0.0  1000.0 0.0 0.0
        pop_matrix
}

{
        push_matrix
          translate 500 500 100
          pointlight 0 0 0  1.0 1.0 1.0
        pop_matrix
}

end
