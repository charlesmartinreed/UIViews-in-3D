#  Core Animation and transforms

Other Core Animation provided UIViews
**CATiledLayer** (seen in Maps, for example), **CAEmitterLayer** (particles)

For CATransform3D, altering the matricies allowes you to alter the strength of the 3D effect by affecting the distance between your eye and where the scene is drawn in the screen. 
For a 4x4 matrix, for example (m11, m12, m21, m22, m31, m32, m41, m42, etc...)
In this example, we might set the value for m34 to -1  / 500, which has a strong 3D effect. But smaller values like -1/2000 would be weaker.
