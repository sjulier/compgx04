% This script runs the odometry

% Configure to disable other sensor types
parameters = minislam.event_generators.simulation.Parameters();
parameters.enableOdometry = false;
parameters.enableGPS = false;
parameters.enableLaser = true;
parameters.laserDetectionRange = 20;

% Set up the simulator and the output
eventGenerator = minislam.event_generators.simulation.Simulator(parameters, 'task3');

% Run GTSAM
gtsamSLAMSystem = model_answers.gtsam.LaserSensor2DSLAMSystem();
gtsamResults = minislam.mainLoop(eventGenerator, gtsamSLAMSystem);

% Plot optimisation times
minislam.graphics.FigureManager.getFigure('Optimization times');
clf
plot(gtsamResults.optimizationTimes)
