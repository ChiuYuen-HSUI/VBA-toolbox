function [suffStat] = VBA_getSuffStat(options,suffStat,flag)
% fills in default sufficient statistics structure
% function [suffStat] = VBA_getSuffStat(options,suffStat,flag)
% IN:
%   - options: the options structure (only the substructure .dim is used here)
%   - suffStat: {[]}
%   - flag: {0}, 1 if online version

if ~exist('flag','var'), flag = 0; end
if ~exist('suffStat','var'), suffStat = struct(); end

dim = options.dim;
dim.online = elvis(flag, dim.n_t, 1); 

suffStat = check_struct(suffStat, ...
    'F'     , []                                    , ...
    'gx'    , zeros(dim.p,dim.n_t)                  , ...
    'vy'    , zeros(dim.p,dim.n_t)                  , ...
    'muX'   , zeros(dim.n,dim.n_t)                  , ...
    'dy'    , zeros(dim.p,dim.n_t)                  , ...
    'dx'    , zeros(dim.n,dim.n_t)                  , ...
    'vdx'   , zeros(dim.n,dim.n_t)                  , ...
    'dx0'   , zeros(dim.n,1)                        , ...
    'dy2'   , zeros(1,numel(options.sources))       , ...
    'dx2'   , 0                                     , ...
    'dtheta', zeros(dim.n_theta,dim.online)         , ...
    'dphi'  , zeros(dim.n_phi  ,dim.online)         , ...
    'Ssigma', 0                                     , ...
    'Sphi'  , 0                                     , ...
    'Stheta', 0                                     , ...
    'Salpha', 0                                     , ...
    'SX'    , 0                                     , ...
    'SX0'   , 0                                     , ...
    'logL'  , -Inf                                    ...
);
    