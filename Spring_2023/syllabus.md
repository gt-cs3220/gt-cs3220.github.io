# CS 3220 Processor Design Spring 2023 Syllabus

**Course Title: CS3220**

**Instructor: Hyesoon Kim, Blaise Tine**

**Class location: KACB 1456**

**Class time: M/W 2:00 PM - 3:15 PM ET** 

**Instructor's Office hours:** Monday 3:30-4:30 KACB 2347 or by appointment.

**TAs**: Anurag Kar, Varun Saxena, Jianming Tong  


**TA's office hours:** Office hours will be posted at Piazza 



**Communication method** 
Please use piazza private posting to communicate with the instructor and the TAs. For general questions, please use piazza public posting so that other students can reply as well. 
 
**Participation points**
Students who provide many helpful postings will receive extra participation points. (up to 3 points in total)  

**Class homepage**: https://gt-cs3220.github.io/

**Online platforms for resource**: We will use **Canvas** for assignment submissions and lecture note distributions. We will also use **Piazza** for discussions. We will use both Canvas and **github** to distribute the homework/project frames. 

In this course, we will study hardware implementation of architecture design. This is an intermediate-level course that follows CS2200. This course is a project-based course in which you will learn pipelined architectures by actually implementing simple instructions using an FPGA (Field-Programmable Gate Array) board. 

**Course Description**

 The course will strengthen the background knowledge of processor design by understanding timing issues, critical path, and other underlying hardware structures. It will also provide an understanding of architecture, hardware design, programming and debugging skills. 

**Topics:**

- Hardware description language (Verilog)
 
- FPGA programming

- FPGA testing 

- Digital design 

- Pipeline design 

- Processor architecture 

- Modern processors

- FPGA programming with High-level synthesis

- Accelerators for emerging workloads

- Pynq Boards 

- Xilinx tool chains 

- Background knowledge of compiler 

 **Pre-requisite**: 

CS2200 and ECE 2031

Textbooks: All online books are available in the library . (http://library.gatech.edu/) 

- Principles and structures of FPGA (FPGA) 

- Quick start guide to verilog (verilog)

- Parallel programming for FPGAs (HLS) (https://arxiv.org/pdf/1805.03648.pdf) 

- Computer Architecture: A Quantitative (Optional book)

**Grading Scheme** 

**Option #1: Regular Track**

  Project assignment 1: 15 

  Project assignment 2: 10

  Project assignment 3: 10

  Project assignment 4: 10

  Project assignment 5: 10 
   
  Homeworks: 15 (3  pts x 5 HWs) 

  Mid-term exam: 15 
  
  Final exam: 15 

  Participation: extra 3 points

**Option #2: Research track** 

Projects #1-4, homeworks, mid-term are the same as option #1. 

Project #5, and the final exam can be substituted with a research project. 

The research project topics will be announced in the later semester.

The research track is limited to the students who have shown good standing in the course.

**Final grade algorithm** 

90% <= score: A

80% <= score < 90%: B

70% <= score < 80%: C

60% <= score < 70%: D

score < 60%: F

A few notes: I plan to use non-curved grade assignments unless there are too few As. 

**FPGA board  & Programming Platforms**: We use Xilinx Pynq boards for the class. 

**Computing Resource**: We provide VMs. 

**Projects** Most of the projects are 2-student projects. Discussions with other students are encouraged. Submitting any work other than you and your partner's own violates the Academic Honor Code. If you are unsure what you can discuss, please contact the instructor. 


**Homework**
Homework assignments are individual, but you can get help from others. If you get help from others students, please include their names. 


**Assignment late policy:** All assignments are due on the day specified by the assignment description and posted online. No late submissions are allowed except for approval from the dean of students. The late submission information will be announced separately, and by default, no late submission. 

Assignment submission rules: You must follow the submission guidelines specified in the assignment description. We will use Canvas. **Wrong file names, broken file formats, missing files might lose 5% of the grade.** 

**Regrades:** Regrades are obtained by submitting a written explanation to the instructor within a week of when the work was returned in class. Regrades will only be discussed after submitting the work in this manner. In order for a test to be regraded, you must neatly state in writing the reason that you would like your test to be regraded. If a test is submitted for a regrade, I have the right to regrade the entire test-so keep in mind that it is possible to lose additional points. Therefore, it is strongly recommended that you do not ask for a regrade unless you have substantial reason to believe that I made a mistake when originally grading the test. All regrade requests should be made within one week after the semester is finished. 

**Office Hours:** Please respect the office hours of the instructor by planning ahead. Other times are possible by appointment. 

**Exam**: A form of digital proctoring might be used in exam.

**Academic Integrity**

The course will follow all relevant and appropriate Georgia Institute of Technology academic regulations (https://policylibrary.gatech.edu/student-life/academic-honor-code) 

**Accommodations for Students with Disabilities**

The course process will follow all relevant and appropriate Georgia Institute of Technology academic regulations, including those relevant to students with disabilities. Any students requiring additional assistance due to disabilities (e.g., learning disabilities) should contact the professor(s) during the first week of the semester. Students requiring extra time for examinations and quizzes are asked to make arrangements at least three days in advance. You may contact the Office of Disability Services (https://disabilityservices.gatech.edu/) regarding campus services.

**Discrimination and Harassment**

Georgia Tech does not discriminate against individuals on the basis of race, color, religion, sex, national origin, age, disability, sexual orientation, or veteran status in the administration of admissions policies, educational policies, employment policies, or any other Institute-governed programs and activities. This class adheres to those guidelines. Alternative viewpoints are welcome in this classroom. However, statements that are deemed racist, sexist, classist, or otherwise discriminatory toward others in the class will not be tolerated.

No form of harassment or discrimination is allowed in this class. In keeping with the professional nature of this course, only professional behavior is acceptable between the instructor and the students and between students. No harassment of any kind is allowed in class, including but not limited to gender, age, ability, religion, sexual orientation, and ethnicity.

**Statement of Intent for Classroom Inclusivity**

As members of the Georgia Tech community, we are committed to creating a learning environment in which all of our students feel safe and included. Because we are individuals with varying needs, we are reliant on your feedback to achieve this goal. To that end, we invite you to enter into dialogue with us about the things we can stop, start, and continue doing to make our classroom an environment in which every student feels valued and can engage actively in our learning community.

**Tentative Schedule**

| week | date    | Topic category       | topic                               | HW deadline                         | Project deadline  |
| ---- | ------- | -------------------- | ----------------------------------- | ----------------------------------- | ----------------- |
| 1    | 1/9/23  | Verilog              | introduction & review               |                                     |                   |
|      | 1/11/23 | Verilog              | introduction to verilog             | [HW #1 (part-1 Sun)](hw1.md)no grading (pass/fail) |                   |
| 2    | 1/16/23 |                      | MLK                                 |                                     |                   |
|      | 1/18/23 | Architecture         | review pipeline                     |                                     |                   |
| 3    | 1/23/23 | Architecture         | pipeline review & project #1 review |       |                   |
|      | 1/25/23 | Architecture         | out of order processor              |  [HW #2 (W)](homework2_fifo/README.md)                                    |     |
| 4    | 1/30/23 | Architecture         | out of order processor              |                                     |                   |
|      | 2/1/23  | Architecture         | Cache and memory systems            |                                     | [Proj#1](project1/README.md): Part-1 (W)        |
| 5    | 2/6/23  | Architecture         | branch predictor                    |                            |                   |
|      | 2/8/23  | Architecture         | GPU architecture                    |                                     | Proj#1: Part-2 (W)        |
| 6    | 2/13/23 | Architecture         | Vortex architecture                 |                                     |                   |
|      | 2/15/23 | Architecture         | graphics                            |           HW #3 (F)               | Proj#3: part-3 (W)                  |
| 7    | 2/20/23 | FPGA                 | Pynq & Jupyter notebook             |                                     |                   |
|      | 2/22/23 | FPGA                 | FPGA structure                      | HW #4 (No grading: pass/fail)       | Project #2  (F)      |
| 8    | 2/27/23 |                      | Review                              |                                     |                   |
|      | 3/1/23  |                      | mid-term                            |                                     |                   |
| 9    | 3/6/23  | Verilog+architecture | Hardware design patterns-I          |                                     |                   |
|      | 3/8/23  | Verilog+architecture | Hardware design patterns-II         | HW #5 (W)                           |                   |
| 10   | 3/13/23 | FPGA                 | FPGA introduction                   |                                     |                   |
|      | 3/15/23 | Architecture         | IEEE Floating points                |                                     | Project #3 (F)       |
| 11   | 3/20/23 |                      | Spring break                        |                                     |                   |
|      | 3/22/23 |                      | Spring break                        |                                     |                   |
| 12   | 3/27/23 | HLS                  | HLS optimization (I)                |                                     |                   |
|      | 3/29/23 | HLS                  | project #5                          | HW #6 (W)                           |                   |
| 13   | 4/3/23  | HLS                  | ML accelerator                      |                                     |                   |
|      | 4/5/23  | Architecture         | systolic Arrays                     |                                     | Project #4 (F)        |
| 14   | 4/10/23 | HLS                  | HLS optimization (II)               |                                     |                   |
|      | 4/12/23 | Architecture         | Power                               | HW #7 (W)                           |                   |
| 15   | 4/17/23 | Architecture         | security                            |                                     |                   |
|      | 4/19/23 |                      | research presentation               |                                     | Project #5 (F)       |
| 16   | 4/24/23 |                      | Review                              |                                     |                   |
|      | 4/28/23 |                      | Final exam  2:40 pm - 5:30 pm       |                                     |                   |
