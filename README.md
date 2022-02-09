# terraform_Koodoo
Koodoo Platform Engineer Technical Assessment 👾
Introduction 🎬

This repo contains a module directory and solution directory. the module directory contains self made modules which are used by the solution's main.tf file. ✅

Algorithm:

    Two seperate modules for Role and User created for a clean environment as well as for reuse by anyone.

    Main.tf file in the solutions directory is created for actuall process.

    Json file is parsed and the indivdual users, database names, collection names and all are retrieved.

    Terraform modules called for user and role creation along with random password generator resource for a password which can be random as well as unique.

    After runnning the terraform aply command, the result is stored in the the required format which can be used by the developers. 💪


Things to consider in my solution 🤔

    It does solve/run for the basic case.
    The uri have been generated according to the demand.
    Password complexity is high as it is taken from inbuilt terraform resource.
    I tested this by setting up a trial version of the MongoDB atlas and running my code.
                                                                                  
                                                                                   
                                                                                   🤝
