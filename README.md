# Fire Detection in Images using MATLAB

This repository contains a MATLAB script for detecting fire in JPEG images. The script processes the image, extracts chrominance components, and applies several masks to detect fire regions.

## Features

- Detects fire in JPEG images
- Extracts Y, Cb, and Cr chrominance components
- Applies multiple masks to identify fire regions
- Displays original image and various stages of processing

## Requirements

- MATLAB

## Usage

1. Clone the repository:
    ```sh
    git clone https://github.com/yourusername/Fire-Detection-using-MATLAB.git
    cd Fire-Detection-using-MATLAB
    ```

2. Open the script in MATLAB.

3. Replace the image file path with your own image in the script:
    ```matlab
    Im1= imread('your_image.jpg'); % provide your file location
    ```

4. Run the script:
    ```matlab
    run('fire_detection.m')
    ```

## Example

```matlab
Im1= imread('fire3.jpg'); % example image provided in the script
