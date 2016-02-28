% 10601A/SV-F15: Introduction to Machine Learning
% Programming Assignment 4: HMM for Speech Recognition
%
% TASK 2: Write a routine that obtains the backward variables.
% ============================================================
% INPUT
%       observations[num_observations, num_features]: a matrix where each row is an observation in the sequence.
%       params:
%         params.initial_probs[num_states, 1]: a column vector where row is a scalar
%             representing the initial probability of the state.
%         params.transition_probs[num_states, num_states]: a matrix where entry (i,j) represents the
%             probability of transitioning from state i to state j.
%         params.observation_probs_means[{i} => [1, num_features]]: a cell array where the ith element
%             is the mean vector of the observation probability distribution
%             of the ith state
%         params.observation_probs_covariances[{i} => [num_features, num_features]]: a cell array where the ith element
%             is the covariance matrix of the observation probability distribution
%             of the ith state;
% ============================================================
% OUTPUT  betas[num_states, num_observations]: The backward variables

function [betas] = get_backward_variables(observations, params)
  num_observations = size(observations, 1);
  num_states = size(params.initial_probs, 1);
  betas = zeros(num_states, num_observations);
  for i=1:num_states
      mu=params.observation_probs_means{i};
      SIGMA = params.observation_probs_covariances{i};
      b(i,:) = mvnpdf(observations,mu,SIGMA); 
  end
  for s=1:num_states
      betas(s,num_observations)=1;
  end
  for t=num_observations-1:-1:1
      for s=1:num_states
          betas(s,t)=sum(betas(:,t+1).*b(:,t+1).*params.transition_probs(:,s));
      end
  end
  
  % Implement your stuff in here.

end
