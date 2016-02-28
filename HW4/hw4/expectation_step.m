% 10601A/SV-F15: Introduction to Machine Learning
% Programming Assignment 4: HMM for Speech Recognition
%
% TASK 3: Write a method for the expectation step and return the variables.
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
%         alphas[num_states, num_observations]: The foward variables
%         betas[num_states, num_observations]: The backward variables
% ============================================================
% OUTPUT  xis[num_states, num_states, num_observations] -  xis[s,s',num_observations] is zero.
% OUTPUT  gammas[num_states, num_observations]

function [xis, gammas] = expectation_step(observations, params, alphas, betas)
  num_features = size(observations, 2);
  num_observations = size(observations, 1);
  num_states = size(params.initial_probs, 1);

  gammas = zeros(num_states, num_observations);
  gamma_variable = zeros(num_states, num_observations);
  xis = zeros(num_states, num_states, num_observations); % Let the matrix for the last time step be all 0's
  
  for i=1:num_states
      mu=params.observation_probs_means{i};
      SIGMA = params.observation_probs_covariances{i};
      b(i,:) = mvnpdf(observations,mu,SIGMA); 
  end
  p=sum(alphas(:,num_observations));
  for t=1:num_observations
      for s=1:num_states
          gammas(s,t)=alphas(s,t)*betas(s,t)/p;
      end
  end
  for t=1:num_observations-1
      for fs=1:num_states
          for bs=1:num_states
              xis(fs,bs,t)=alphas(fs,t)*b(bs,t+1)*params.transition_probs(fs,bs)*betas(bs,t+1)/p;
          end
      end
  end
  
  % Implement your stuff in here.

end
