% including the different directories
% used in this project
Main_dir=pwd;
cd ..
cd Car_kinematics
CarKin_dir=pwd;
cd ..
cd Gaussian_3d_torus
Gaus3d_dir=pwd;
cd ..
cd Heading_controller
HeadCntrl_dir=pwd;
cd ..
cd DRF_model
DRFmodel_dir=pwd;
cd ..
cd Obstacles
Obstacles_dir=pwd;
cd ..
cd Plotting
Plotting_dir=pwd;
cd ..
cd Road_functions
Roadfunc_dir=pwd;
cd ..
cd recorded_data
recordata_dir=pwd;
cd ..
cd Debug_concept
dbconcept_dir=pwd;
cd ..
cd Lateral_Deviation
latdev_dir=pwd;


addpath(CarKin_dir,Gaus3d_dir,HeadCntrl_dir,DRFmodel_dir,...
        Obstacles_dir,Plotting_dir,Roadfunc_dir,recordata_dir,...
        dbconcept_dir,latdev_dir);

cd (Main_dir);