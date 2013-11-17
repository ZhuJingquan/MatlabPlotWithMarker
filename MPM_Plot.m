function MPM_Plot

global MPMOptions;
global MPMCurves;
global MPMLegends;

colors = ...
    { ...
        [0 0 1], ...
        [1 0 0], ...
        [0 0.50 0], ...
        [0 0 0], ...
        [0.65 0.16 0.16], ...
        [0 1 1]...
        [1 0 1]...
        [0.56 0.93 0.56]...
        [1 0.65 0]...
        [0.80 0.52 0.25]...
        [0.55 0 0]...
        [0.68 0.85 0.90]...
        [0.44 0.50 0.56]...
};

markers = {'o','x','diamond','square','*','v','pentagram','hexagram','^'};

showLegends = 0;

for i = 1:length(MPMLegends),
    if(~isempty(MPMLegends{i})),
        showLegends = 1;
    end
end


[~, c] = size(MPMCurves);

if(MPMOptions.FixedLength > 0),
    for i = 1:c,
        MPMCurves{i} = interp1(1:length(MPMCurves{i}), MPMCurves{i}, 1:length(MPMCurves{i})/MPMOptions.FixedLength:length(MPMCurves{i}),'spline');
    end
end

figure;
if(MPMOptions.MarkerCount > 0),
    for i = 1:c,
        if(i > 1)
            hold on;
        end
        colorIndex = mod(i, length(colors)) + 1;
        markerIndex = mod(i, length(markers)) + 1;
        
        curInterval = floor(length(MPMCurves{i}) / (MPMOptions.MarkerCount - 1));
        
        xs = 1:curInterval:length(MPMCurves{i});
        ys = GetSample(MPMCurves{i}, curInterval);
        curPlot = plot(xs, ys);
        set(curPlot, 'Color', colors{colorIndex});
        set(curPlot, 'Marker', markers{markerIndex},'LineStyle','none', 'MarkerSize', 8);

    end
 
    if(showLegends == 1),
        legend(MPMLegends);
    end
    
    hold on;
end


for i = 1:c,
    if(i > 1)
        hold on;
    end
    colorIndex = mod(i,length(colors)) + 1;
    curPlot = plot(MPMCurves{i});
    set(curPlot, 'Color', colors{colorIndex});
end

if(showLegends && MPMOptions.MarkerCount <= 0),
    legend(MPMLegends);
end

end

function y = GetSample(line, interval)

x = 1:interval:length(line);
y = zeros(1, length(x));

for i = 1:length(x),
    y(i) = line(x(i));
end

end
