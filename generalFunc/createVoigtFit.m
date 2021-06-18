function [fitresult, gof] = createVoigtFit(x, y, center, top)
%createVoigtFit(x, y, center, top)
%  近似を作成します。
%
%  '新規近似 1' に対するデータを近似:
%      X 入力:  wavelengths2
%      Y 出力:  data2
%  出力:
%      fitresult: 近似を表す fit オブジェクト。
%      gof: 適合性情報をもつ構造体。
%
%  参考 FIT, CFIT, SFIT.

%  MATLAB からの自動生成日: 07-May-2021 16:14:51
if(~exist("top","var"))
    top = max(y);
end
%% 近似: '新規近似 1'。
[xData, yData] = prepareCurveData( x, y );

% 近似タイプとオプションを設定します。
ft = fittype( 'voigt2(x,a,b,g,l) + c*x +d', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'notify';
opts.MaxFunEvals = 600;
opts.MaxIter = 400;
opts.StartPoint = [top center 0 0 0.2 0.2];
opts.Upper = [2*max(y) max(x) Inf Inf Inf Inf];
opts.Lower = [0        min(x) -Inf -Inf -0 -0];

% モデルをデータに近似します。
[fitresult, gof] = fit( xData, yData, ft, opts );

% データの近似をプロットします。
f = figure( 'Name', 'Voigt近似' );
h = plot( fitresult, 'r');
hold on
h = plot(xData, yData, 'bo');
legend( f.CurrentAxes, 'Voigt Fit', 'Raw Data', 'Location', 'NorthWest', 'Interpreter', 'none' );
% ラベル Axes
grid on
FigSeikei(f);

