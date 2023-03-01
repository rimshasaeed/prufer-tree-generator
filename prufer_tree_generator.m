clc, clearvars, close all

pf_code = input("Enter your prufer code separated by comma: ");
% For example:
%           pf_code = [2,5,5,2,3];

number_of_vertices = numel(pf_code) + 2;
vertices = 1:number_of_vertices;

%% Build prufer tree
% Loop over the entire prufer code
for i=1:length(pf_code)
    % Find minimum value in vertices that is not included in prufer code
    for j = vertices
        if ~ismember(j, pf_code)
            vertex = j;
            break
        end
    end
    
    % Compute tree edges and store them in a cell
    edge{i} = [vertex, pf_code(1)];
    
    % Update prufer code
    pf_code = [pf_code(2:end) vertex];
end

% Find the missing vertex
idx = ~ismember(vertices, cell2mat(edge));
if any(idx ==1)
    vertex = vertices(idx);
    
    % Connect missing vertex to last node
    edge{i+1} = [vertex, edge{end}(2)];
end
 
% Plot tree
G = graph();
for i = 1:numel(edge)
    G = addedge(G, edge{i}(1), edge{i}(2));
end
plot(G)
title('Prufer tree')
 
%% Get edge matrix
edge_matrix = zeros(2, numel(edge));
for i = 1:numel(edge)
    edge_matrix(1,i) = edge{i}(1);
    edge_matrix(2,i) = edge{i}(2);
end
disp('Edge Matrix:')
disp(edge_matrix)

%% Compute lst and L
lst = zeros(1, length(edge_matrix)+1);
lst(1) = 0;
L = [];
for i=1:numel(vertices)
    current_neighbor = neighbors(G, i);
    L = [L current_neighbor'];
    lst(i+1) = numel(L);
end

disp('Array L:')
disp(L)
disp('Array lst:')
disp(lst)