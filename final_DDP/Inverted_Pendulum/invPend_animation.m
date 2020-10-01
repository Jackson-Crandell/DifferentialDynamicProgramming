function [ ] = invPend_animation(x,horizon)
O=[0 0];
axis(gca,'equal');
axis([-1.5 1.5 -1.5 1.5]);
grid on
for i=1:horizon
    P=1*[sin(x(1,i)) -cos(x(1,i))];
    
    pend=line([O(1) P(1)],[O(2) P(2)], 'LineWidth', 4);
    F(i) = getframe(gcf);
    pause(0.01);
    if i<1000
        
        delete(pend);
        
    end
end

save_video = false;
if (save_video)
    video = VideoWriter('InvPend.avi','Uncompressed AVI');
    open(video)
    writeVideo(video,F)
    close(video)
end

end

