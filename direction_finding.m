%% Illustration de la formation de voies et de Capon
% Direction Finding
% DOA ou AOA : Direction of Arrival, Angle
% 02/10/2024 - Groupe JPB
clear all
close all
clc

% Construction des données :
% Choisir les angles d'arrivée
f = 5000;
c = 3.10e8;
N = 4;
lambda = c/f;
d = lambda/2; % Vérifier le théorème de Shannon (spatial)
Theta = [10 20]; % Angles en degrés
k = 1:N;

% Génération des vecteurs de réponse pour les deux angles
a1 = exp(-1j*2*pi*d*f/c*sin(Theta(1)*pi/180)*(k-1));
a2 = exp(-1j*2*pi*d*f/c*sin(Theta(2)*pi/180)*(k-1));
A = [a1' a2'];

% Génération du signal de source
S = randn(2,1000); % 2 sources, 1000 échantillons

% Génération des signaux reçus
X = A*S; % X = A * S

% Direction Finding : Beamforming (formation de voies)
Gammaxx = (X*X')./size(X,2); % Covariance estimée, normalisation par le nombre d'échantillons

pas = 1;
a = zeros(N,1);

% Initialisation des vecteurs pour les méthodes Pfv et Capon
Pfv = zeros(1, length(-90:pas:90));
Pcapon = zeros(1, length(-90:pas:90));

% Formation de faisceau (Beamforming) et méthode de Capon
i = 0;
for theta = -90:pas:90
    i = i + 1;
    for k = 1:N
        a(k) = exp(-1j*2*pi*d*f/c*sin(theta*pi/180)*(k-1)); % Angles en radians
    end
    Pfv(i) = a' * Gammaxx * a / N; % Méthode formation de voies
    Pcapon(i) = 1 / (a' * inv(Gammaxx) * a); % Méthode de Capon
end

% Tracé des résultats
subplot(211)
theta = -90:pas:90;
plot(theta, abs(Pfv) ./ max(abs(Pfv)), 'b', 'LineWidth', 2) % Normalisation
hold on
plot(theta, abs(Pcapon) ./ max(abs(Pcapon)), 'r', 'LineWidth', 2) % Normalisation
xlabel('AOA')
ylabel('|Pfv(\theta)|')
legend('Direction finding : Formation de voies','Capon')

% Tracé polaire (avec angles en radians)
subplot(212)
polarplot(theta*pi/180, abs(Pfv)) % Utilisation de polarplot() au lieu de polar()

