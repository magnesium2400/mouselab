%% Simple examples
figure; plotAllenSlice(); 
figure; plotAllenSlice('dim', 'c', 'slice', 0.3, 'resolution', 50);
%% Layout example
figure; tl = tiledlayout(2,2,'TileSpacing','none'); clc;
nexttile; plotAllenSlice('dim', 'c'); 
nexttile; plotAllenSlice('dim', 's'); 
nexttile; plotAllenSlice('dim', 't'); 
%% Different resolutions
figure; 
nexttile; plotAllenSlice('dim', 'c', 'slice', 0.3, 'resolution',  25); 
nexttile; plotAllenSlice('dim', 'c', 'slice', 0.3, 'resolution',  50); 
nexttile; plotAllenSlice('dim', 'c', 'slice', 0.3, 'resolution', 100); 
%% Different directions
figure; 
nexttile; plotAllenSlice('dim', 'c', 'slice', 0.3, 'resolution', 100); 
nexttile; plotAllenSlice('dim', 's', 'slice', 0.3, 'resolution', 100); 
nexttile; plotAllenSlice('dim', 't', 'slice', 0.3, 'resolution', 100); 
%% Different views combined
figure;  plotAllenSlice('dim', 'c', 'slice', 0.7, 'resolution',  50); 
hold on; plotAllenSlice('dim', 't', 'slice', 0.7, 'resolution',  50); 
hold on; plotAllenSlice('dim', 's', 'slice', 0.3, 'resolution',  50); 
view(3); 
%% Different views combined
figure;  plotAllenSlice('dim', 'c', 'slice', 0.7, 'resolution',  25); 
hold on; plotAllenSlice('dim', 't', 'slice', 0.7, 'resolution', 100); 
hold on; plotAllenSlice('dim', 's', 'slice', 0.3, 'resolution',  50); 
view(3); 
%% Different types
figure;
nexttile; plotAllenSlice('annotation', 'cmap', flip(gray), 'slice', 0.7);
nexttile; plotAllenSlice('ara_nissl',  'cmap', sky); 
nexttile; plotAllenSlice('average_template'); 
%% Interactive
videofigs(132, @(n) plotAllenSlice('dim', 'c', 'slice', n, 'resolution', 100));
videofigs(228, @(n) plotAllenSlice('dim', 's', 'slice', n, 'resolution', 50));
videofigs(320, @(n) plotAllenSlice('dim', 't', 'slice', n, 'resolution', 25));

