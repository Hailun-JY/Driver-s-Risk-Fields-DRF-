
% load('circuit_run1_2.mat')
% close all
% for movie_ii=1:5140
%    imshow(F(movie_ii).cdata)
%    pause(0.1)
% end

% load('circuit_run2.mat')
close all
N=3300;
for movie_ii=1:N
   imshow(F(movie_ii).cdata)
   pause(0.01)
end
%%
v = VideoWriter('normal1.avi');
% v = VideoWriter('tt.avi');
v.FrameRate=15;
% v.Quality=100;
open(v);
writeVideo(v,F(1:N));
close(v);