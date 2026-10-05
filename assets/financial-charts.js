/**
 * MEERA ASSOCIATES - FINANCIAL PERFORMANCE CHARTS ENGINE
 * Interactive multi-metric financial charts for unlisted scrips:
 * Revenue, Profit After Tax (PAT), EBITDA / EBITA, and EPS.
 * 
 * Supports:
 * - Tab switching: All Metrics, Revenue, EBITDA, PAT, EPS
 * - Chart type toggle: Bar Chart vs Line Chart
 * - Dual Y-Axis (₹ Cr for financial volumes vs ₹ for EPS)
 * - Custom brand themes (Standard Navy/Gold, Sterlite High-Tech, Anugraha Emerald)
 * - Responsive resizing & Chart.js offline fallback
 */

(function () {
    'use strict';

    // Global registry of initialized charts
    window.MeeraFinancialCharts = window.MeeraFinancialCharts || {};

    const THEME_PRESETS = {
        standard: {
            revenue: { bar: '#0284c7', line: '#0284c7', bg: 'rgba(2, 132, 199, 0.15)' },
            ebitda:  { bar: '#0d9488', line: '#0d9488', bg: 'rgba(13, 148, 136, 0.15)' },
            pat:     { bar: '#d97706', line: '#d97706', bg: 'rgba(217, 119, 6, 0.15)' },
            eps:     { bar: '#7c3aed', line: '#7c3aed', bg: 'rgba(124, 58, 237, 0.15)' },
            grid:    '#e2e8f0',
            text:    '#475569',
            heading: '#0f2942'
        },
        sterlite: {
            revenue: { bar: '#38bdf8', line: '#38bdf8', bg: 'rgba(56, 189, 248, 0.2)' },
            ebitda:  { bar: '#34d399', line: '#34d399', bg: 'rgba(52, 211, 153, 0.2)' },
            pat:     { bar: '#fbbf24', line: '#fbbf24', bg: 'rgba(251, 191, 36, 0.2)' },
            eps:     { bar: '#a78bfa', line: '#a78bfa', bg: 'rgba(167, 139, 250, 0.2)' },
            grid:    'rgba(255, 255, 255, 0.08)',
            text:    '#94a3b8',
            heading: '#f8fafc'
        },
        anugraha: {
            revenue: { bar: '#1e40af', line: '#1e40af', bg: 'rgba(30, 64, 175, 0.15)' },
            ebitda:  { bar: '#16a34a', line: '#16a34a', bg: 'rgba(22, 163, 74, 0.15)' },
            pat:     { bar: '#ea580c', line: '#ea580c', bg: 'rgba(234, 88, 12, 0.15)' },
            eps:     { bar: '#9333ea', line: '#9333ea', bg: 'rgba(147, 51, 234, 0.15)' },
            grid:    '#e2e8f0',
            text:    '#475569',
            heading: '#0f2439'
        }
    };

    /**
     * Initializes a financial graph inside a wrapper element.
     * @param {Object} options Configuration options
     */
    function initFinancialChart(options) {
        const {
            containerId,
            canvasId,
            years,
            revenue,
            ebitda,
            pat,
            eps,
            theme = 'standard',
            title = 'Financial Trajectory',
            secondMetricLabel = 'EBITDA',
            revenueLabel = 'Total Revenue'
        } = options;

        const container = document.getElementById(containerId);
        if (!container) return;

        const canvas = document.getElementById(canvasId);
        if (!canvas) return;

        const themeColors = THEME_PRESETS[theme] || THEME_PRESETS.standard;
        let currentMetric = 'all'; // 'all', 'revenue', 'ebitda', 'pat', 'eps'
        let currentType = 'bar';   // 'bar' or 'line'
        let chartInstance = null;

        // Verify if Chart.js is available
        if (typeof Chart === 'undefined') {
            renderFallbackSVG(container, options);
            return;
        }

        // Build Chart.js Datasets
        function getDatasets(metric, type) {
            const isLine = type === 'line';

            if (metric === 'all') {
                return [
                    {
                        label: `${revenueLabel} (₹ Cr)`,
                        data: revenue,
                        type: isLine ? 'line' : 'bar',
                        backgroundColor: themeColors.revenue.bar,
                        borderColor: themeColors.revenue.line,
                        borderWidth: isLine ? 3 : 1,
                        borderRadius: isLine ? 0 : 6,
                        yAxisID: 'y',
                        tension: 0.35,
                        fill: false,
                        order: 2
                    },
                    {
                        label: `${secondMetricLabel} (₹ Cr)`,
                        data: ebitda,
                        type: isLine ? 'line' : 'bar',
                        backgroundColor: themeColors.ebitda.bar,
                        borderColor: themeColors.ebitda.line,
                        borderWidth: isLine ? 3 : 1,
                        borderRadius: isLine ? 0 : 6,
                        yAxisID: 'y',
                        tension: 0.35,
                        fill: false,
                        order: 3
                    },
                    {
                        label: 'Profit After Tax (₹ Cr)',
                        data: pat,
                        type: isLine ? 'line' : 'bar',
                        backgroundColor: themeColors.pat.bar,
                        borderColor: themeColors.pat.line,
                        borderWidth: isLine ? 3 : 1,
                        borderRadius: isLine ? 0 : 6,
                        yAxisID: 'y',
                        tension: 0.35,
                        fill: false,
                        order: 4
                    },
                    {
                        label: 'EPS (₹/share)',
                        data: eps,
                        type: 'line', // Always line for clear distinction
                        backgroundColor: themeColors.eps.bar,
                        borderColor: themeColors.eps.line,
                        borderWidth: 3,
                        pointBackgroundColor: '#ffffff',
                        pointBorderColor: themeColors.eps.line,
                        pointBorderWidth: 2,
                        pointRadius: 6,
                        pointHoverRadius: 8,
                        yAxisID: 'y1',
                        tension: 0.35,
                        fill: false,
                        order: 1
                    }
                ];
            }

            // Single Metric Focus View
            const configMap = {
                revenue: {
                    label: `${revenueLabel} (₹ Cr)`,
                    data: revenue,
                    color: themeColors.revenue,
                    unit: '₹ Cr',
                    yAxisID: 'y'
                },
                ebitda: {
                    label: `${secondMetricLabel} (₹ Cr)`,
                    data: ebitda,
                    color: themeColors.ebitda,
                    unit: '₹ Cr',
                    yAxisID: 'y'
                },
                pat: {
                    label: 'Profit After Tax (₹ Cr)',
                    data: pat,
                    color: themeColors.pat,
                    unit: '₹ Cr',
                    yAxisID: 'y'
                },
                eps: {
                    label: 'Earnings Per Share (₹)',
                    data: eps,
                    color: themeColors.eps,
                    unit: '₹',
                    yAxisID: 'y1'
                }
            };

            const selected = configMap[metric] || configMap.revenue;
            return [
                {
                    label: selected.label,
                    data: selected.data,
                    type: isLine ? 'line' : 'bar',
                    backgroundColor: isLine ? selected.color.bg : selected.color.bar,
                    borderColor: selected.color.line,
                    borderWidth: isLine ? 3 : 1,
                    borderRadius: isLine ? 0 : 8,
                    yAxisID: 'y',
                    tension: 0.35,
                    fill: isLine,
                    pointBackgroundColor: '#ffffff',
                    pointBorderColor: selected.color.line,
                    pointBorderWidth: 2,
                    pointRadius: 6,
                    pointHoverRadius: 8
                }
            ];
        }

        // Build Chart.js Scale Options
        function getScales(metric) {
            const isAll = metric === 'all';
            const isEPSOnly = metric === 'eps';
            const isMobile = typeof window !== 'undefined' && window.innerWidth < 640;

            const scales = {
                x: {
                    grid: {
                        color: themeColors.grid,
                        drawBorder: false
                    },
                    ticks: {
                        color: themeColors.text,
                        font: {
                            family: "'Plus Jakarta Sans', sans-serif",
                            weight: '600',
                            size: isMobile ? 10 : 12
                        }
                    }
                },
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                    grid: {
                        color: themeColors.grid,
                        drawBorder: false
                    },
                    ticks: {
                        color: themeColors.text,
                        font: {
                            family: "'Plus Jakarta Sans', sans-serif",
                            size: isMobile ? 9.5 : 11
                        },
                        callback: function (val) {
                            return isEPSOnly ? '₹' + val : '₹' + val + ' Cr';
                        }
                    },
                    title: {
                        display: !isMobile,
                        text: isEPSOnly ? 'Earnings Per Share (₹)' : 'Financial Value (₹ in Crores)',
                        color: themeColors.text,
                        font: {
                            family: "'Plus Jakarta Sans', sans-serif",
                            weight: '600',
                            size: 12
                        }
                    }
                }
            };

            if (isAll) {
                scales.y1 = {
                    type: 'linear',
                    display: true,
                    position: 'right',
                    grid: {
                        drawOnChartArea: false
                    },
                    ticks: {
                        color: themeColors.eps.line,
                        font: {
                            family: "'Plus Jakarta Sans', sans-serif",
                            size: isMobile ? 9.5 : 11,
                            weight: '600'
                        },
                        callback: function (val) {
                            return '₹' + val;
                        }
                    },
                    title: {
                        display: !isMobile,
                        text: 'EPS (₹ / Share)',
                        color: themeColors.eps.line,
                        font: {
                            family: "'Plus Jakarta Sans', sans-serif",
                            weight: '700',
                            size: 12
                        }
                    }
                };
            }

            return scales;
        }

        // Render / Update Chart
        function renderChart() {
            if (chartInstance) {
                chartInstance.destroy();
            }

            const isMobile = typeof window !== 'undefined' && window.innerWidth < 640;
            const ctx = canvas.getContext('2d');
            chartInstance = new Chart(ctx, {
                type: currentType,
                data: {
                    labels: years,
                    datasets: getDatasets(currentMetric, currentType)
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    interaction: {
                        mode: 'index',
                        intersect: false
                    },
                    plugins: {
                        legend: {
                            position: 'top',
                            labels: {
                                color: themeColors.text,
                                font: {
                                    family: "'Plus Jakarta Sans', sans-serif",
                                    weight: '600',
                                    size: isMobile ? 10 : 12
                                },
                                usePointStyle: true,
                                padding: isMobile ? 8 : 16,
                                boxWidth: isMobile ? 8 : 12
                            }
                        },
                        tooltip: {
                            backgroundColor: 'rgba(15, 23, 42, 0.94)',
                            titleColor: '#ffffff',
                            bodyColor: '#e2e8f0',
                            borderColor: 'rgba(255, 255, 255, 0.1)',
                            borderWidth: 1,
                            padding: 12,
                            boxPadding: 6,
                            usePointStyle: true,
                            callbacks: {
                                label: function (context) {
                                    let label = context.dataset.label || '';
                                    let val = context.parsed.y;
                                    if (label) {
                                        label += ': ';
                                    }
                                    if (context.dataset.label.includes('EPS')) {
                                        label += '₹' + Number(val).toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
                                    } else {
                                        label += '₹' + Number(val).toLocaleString('en-IN', { minimumFractionDigits: 2, maximumFractionDigits: 2 }) + ' Cr';
                                    }
                                    return label;
                                }
                            }
                        }
                    },
                    scales: getScales(currentMetric)
                }
            });

            window.MeeraFinancialCharts[canvasId] = chartInstance;
        }

        // Attach Metric Filter Tabs
        const tabButtons = container.querySelectorAll('.fin-metric-tab');
        tabButtons.forEach(btn => {
            btn.addEventListener('click', function () {
                tabButtons.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                currentMetric = this.getAttribute('data-metric');
                renderChart();
            });
        });

        // Attach Chart Type Switcher
        const typeButtons = container.querySelectorAll('.fin-type-btn');
        typeButtons.forEach(btn => {
            btn.addEventListener('click', function () {
                typeButtons.forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                currentType = this.getAttribute('data-type');
                renderChart();
            });
        });

        // Initial render
        renderChart();
    }

    /**
     * Fallback SVG renderer for offline/isolated environments without Chart.js
     */
    function renderFallbackSVG(container, options) {
        const chartWrapper = container.querySelector('.fin-chart-canvas-wrapper');
        if (!chartWrapper) return;

        const { years, revenue, ebitda, pat, eps } = options;
        const maxVal = Math.max(...revenue, ...ebitda, ...pat, 100);

        let barsHtml = '';
        years.forEach((yr, idx) => {
            const revHeight = ((revenue[idx] || 0) / maxVal) * 160;
            const ebHeight = ((ebitda[idx] || 0) / maxVal) * 160;
            const patHeight = ((pat[idx] || 0) / maxVal) * 160;

            barsHtml += `
                <div style="flex: 1; display: flex; flex-direction: column; align-items: center; gap: 8px;">
                    <div style="height: 180px; width: 100%; display: flex; align-items: flex-end; justify-content: center; gap: 8px; border-bottom: 2px solid #cbd5e1;">
                        <div style="width: 22px; height: ${Math.max(revHeight, 4)}px; background: #0284c7; border-radius: 4px 4px 0 0;" title="Revenue: ₹${revenue[idx]} Cr"></div>
                        <div style="width: 22px; height: ${Math.max(ebHeight, 4)}px; background: #0d9488; border-radius: 4px 4px 0 0;" title="EBITDA: ₹${ebitda[idx]} Cr"></div>
                        <div style="width: 22px; height: ${Math.max(patHeight, 4)}px; background: #d97706; border-radius: 4px 4px 0 0;" title="PAT: ₹${pat[idx]} Cr"></div>
                    </div>
                    <strong style="font-size: 0.85rem; color: #1e293b;">${yr}</strong>
                    <span style="font-size: 0.78rem; color: #7c3aed; font-weight: 700;">EPS: ₹${eps[idx]}</span>
                </div>
            `;
        });

        chartWrapper.innerHTML = `
            <div style="padding: 20px; display: flex; flex-direction: column; gap: 16px;">
                <div style="display: flex; justify-content: center; gap: 16px; font-size: 0.82rem; font-weight: 700;">
                    <span style="color: #0284c7;">■ Revenue</span>
                    <span style="color: #0d9488;">■ EBITDA</span>
                    <span style="color: #d97706;">■ PAT</span>
                    <span style="color: #7c3aed;">● EPS</span>
                </div>
                <div style="display: flex; gap: 20px; padding: 10px 0;">
                    ${barsHtml}
                </div>
            </div>
        `;
    }

    // Expose API
    window.initFinancialChart = initFinancialChart;
})();
