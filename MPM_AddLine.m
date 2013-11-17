function MPM_AddLine(vec, lineLegend)

if(nargin < 2)
    lineLegend = '';
end

global MPMCurves;
global MPMLegends;

MPMCurves{end + 1} = vec;
MPMLegends{length(MPMCurves)} = lineLegend;