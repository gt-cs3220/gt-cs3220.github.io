/*
 * Copyright 2020 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef CONVOLUTION_H_
#define CONVOLUTION_H_

#include <assert.h>
#include <stdint.h>
#include <stdio.h>
//#include <hls_stream.h>

#define MAX_IMG_ROWS 1080
#define MAX_IMG_COLS 1920

#define TEST_IMG_ROWS 100
#define TEST_IMG_COLS 100 // 150 to 100
#define KERNEL_HEIGHT  3
#define KERNEL_WIDTH 3
#define IMAGE_SIZE 10000 // need to match with jupyter size
#define KERNEL_SIZE 9    // need to match with jupyter size

//#define TEST_IMG_ROWS 5
//#define TEST_IMG_COLS 5

//#define TEST_IMG_ROWS 5
//#define TEST_IMG_COLS 640

#define TEST_IMG_SIZE (TEST_IMG_ROWS * TEST_IMG_COLS)

typedef int32_t data_t;

void convolution(const data_t *src, data_t *dst,  const data_t *kernel );

#endif // CONVOLUTION_H_ not defined
