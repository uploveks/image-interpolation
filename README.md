# <span style="color:skyblue">Image Interpolation</span>
This project is an implementation of image interpolation algorithms in MATLAB, including bicubic, proximal, and Lanczos interpolation.

# Table of Contents
1. [About the Project](#start-description)
2. [Proximal Interpolation](#proximal-description)
3. [Lanczos Interpolation](#lanczos-description)
4. [Bicubic Interpolation](#bicubic-description)
5. [Using Project](#using-description)
6. [Testing](#testing-description)

<a name="start-description"></a>
## About the Project
This project provides an implementation of various image interpolation algorithms in MATLAB, including proximal, bicubic, and Lanczos interpolation. Image interpolation is a commonly used technique in image processing that can increase the resolution of images, reduce noise, and improve overall image quality. With these tools, users can experiment with different interpolation algorithms and compare their results to find the best solution for their needs.


<a name="proximal-description"></a>
## Proximal Interpolation
Proximal interpolation is a simple method of interpolation that works by using the nearest neighboring pixel values to estimate new pixel values. This implementation of proximal interpolation includes functions for resizing and upscaling images.

### Proximal_2x2
- The Proximal_2x2 function performs proximal interpolation on a 2x2 grayscale image. It first calculates the scale factors sx and sy by dividing the number of points in the final row and column by the number of points in the initial row and column. Then, it calculates the positions of the new points by dividing the indices of the new row and column by the scale factors and rounding up to the nearest integer. Finally, it uses these positions to determine the values of the new pixels by taking the values of the nearest neighboring pixels from the original image.

### Proximal_2x2_RGB
- The Proximal_2x2_RGB function performs proximal interpolation on a 2x2 RGB image. It separates the image into three color channels, performs proximal interpolation on each channel using the Proximal_2x2 function, and then concatenates the channels back together to form the final image.

### Proximal_resize
- The Proximal_resize function performs proximal interpolation on a grayscale image of any size. It calculates the scale factors sx and sy as the ratios of the final row and column size to the initial row and column size, respectively. It then calculates the positions of the new points by dividing the indices of the new row and column by the scale factors and rounding up to the nearest integer. Finally, it uses these positions to determine the values of the new pixels by taking the values of the nearest neighboring pixels from the original image.

<a name="lanczos-description"></a>
## Lanczos Interpolation
The Lanczos_resize function performs Lanczos interpolation on a grayscale image of any size. It first creates a window of neighboring pixels around each new pixel using the Lanczos kernel. Then, it calculates the weighted average of the neighboring pixel values to determine the value of the new pixel. Finally, it uses these values to form the final image.

### Lanczos_resize
- The Lanczos_resize function performs Lanczos interpolation on a grayscale image of any size. It first creates a window of neighboring pixels around each new pixel using the Lanczos kernel. Then, it calculates the weighted average of the neighboring pixel values to determine the value of the new pixel. Finally, it uses these values

- <a name="bicubic-description"></a>
## Bicubic Interpolation
Bicubic interpolation is a widely used interpolation technique that estimates pixel values using a weighted average of neighboring pixels. This implementation of bicubic interpolation includes a function for resizing and upscaling grayscale and RGB images.

### Bicubic_resize
- The Bicubic_resize function performs bicubic interpolation on a grayscale image of any size. It first creates a window of neighboring pixels around each new pixel using a bicubic kernel. Then, it calculates the weighted average of the neighboring pixel values to determine the value of the new pixel. Finally, it uses these values to form the final image.

### Bicubic_resize_RGB
- The Bicubic_resize_RGB function performs bicubic interpolation on an RGB image. It separates the image into its red, green, and blue channels, performs bicubic interpolation on each channel using the Bicubic_resize function, and then concatenates the channels back together to form the final image.

- <a name="using-description"></a>
## Using Project
In order to use a function you'll have to:
1. Read the image into the system with imread
2. Send the image with other params in the specific function
3. After that as an result you will get an image (greyscaled or RGB)
4. After receving the image you should write on disk with imwrite

```BASH
    image = imread("\...\...\'image.jpg'");
    image = bicubic_resize(image, 2, 2);
    imwrite(image, "\...\...\'image2.jpg'");
```

<a name="testing-description"></a>
## Testing
To get a sense of how the project functions and operates, you'll need to follow these steps:

- Make sure you're running the code in OCTAVE, not MATLAB.

- Navigate to the folder containing the interpolation you want to examine.

- For instance, if you want to test proximal and then bicubic interpolation, enter the following command:

```BASH
  check_proximal();
  check_bicubic();
    
```

Upon completion, you should receive messages indicating which tests have passed and which have not (depending on your system).__




