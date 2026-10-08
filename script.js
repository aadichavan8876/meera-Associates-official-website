/**
 * MEERA ASSOCIATES - DYNAMIC INTERACTIVES & EFFECTS
 * Features:
 * 1. Shiny Sky-Blue Mouse Follower Light
 * 2. Fixed Glassmorphic Header (Scroll Color Stability)
 * 3. Computer Screen Dashboard Animated GIF Simulation
 * 4. Allocation Modal Trigger & Navigation Handling
 */

document.addEventListener('DOMContentLoaded', () => {

    /* ==========================================
       0. MANDATORY DISCLAIMER POP-UP MODAL LOGIC (HOME PAGE ONLY)
       ========================================== */
    const isHomePage = document.body.classList.contains('home-page') || 
                       window.location.pathname.endsWith('index.html') || 
                       window.location.pathname === '/' || 
                       window.location.pathname.endsWith('/');

    const disclaimerModal = document.getElementById('disclaimer-modal');
    const disclaimerCheckbox = document.getElementById('disclaimer-checkbox');
    const disclaimerSubmitBtn = document.getElementById('disclaimer-submit-btn');

    if (!isHomePage) {
        // Enforce that disclaimer popup NEVER appears on internal/sub pages
        if (disclaimerModal) {
            disclaimerModal.remove();
        }
        document.body.classList.remove('disclaimer-open');
    } else if (disclaimerModal) {
        // Clear legacy permanent localStorage flag so it doesn't block visits
        try {
            localStorage.removeItem('meera_disclaimer_accepted');
        } catch (e) {}

        const DISCLAIMER_SESSION_KEY = 'meera_disclaimer_session_accepted';

        function checkDisclaimerStatus() {
            // Check if visitor has already accepted the disclaimer in the current session
            let hasAccepted = false;
            try {
                hasAccepted = sessionStorage.getItem(DISCLAIMER_SESSION_KEY) === 'true';
            } catch (e) {
                hasAccepted = false;
            }

            if (!hasAccepted) {
                // First-time visit: show disclaimer popup
                disclaimerModal.classList.add('active');
                document.body.classList.add('disclaimer-open');
            } else {
                // Already accepted in this session: do not show on page reloads or return visits
                disclaimerModal.classList.remove('active');
                document.body.classList.remove('disclaimer-open');
            }
        }

        if (disclaimerCheckbox && disclaimerSubmitBtn) {
            disclaimerCheckbox.checked = false;
            disclaimerSubmitBtn.disabled = true;

            disclaimerCheckbox.addEventListener('change', () => {
                disclaimerSubmitBtn.disabled = !disclaimerCheckbox.checked;
            });

            disclaimerSubmitBtn.addEventListener('click', () => {
                if (disclaimerCheckbox.checked) {
                    // Record in sessionStorage so it does NOT appear again on page reloads
                    try {
                        sessionStorage.setItem(DISCLAIMER_SESSION_KEY, 'true');
                    } catch (e) {}

                    disclaimerModal.classList.remove('active');
                    document.body.classList.remove('disclaimer-open');
                    window.dispatchEvent(new CustomEvent('meera:disclaimerAccepted'));
                }
            });
        }

        // Prevent closing via Escape key
        window.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && disclaimerModal && disclaimerModal.classList.contains('active')) {
                e.preventDefault();
                e.stopPropagation();
            }
        }, true);

        checkDisclaimerStatus();
    }

    /* ==========================================
       1. SHINY SKY BLUE MOUSE LIGHT FOLLOWER
       ========================================== */
    const mouseLight = document.getElementById('mouse-light-follower');
    let mouseX = window.innerWidth / 2;
    let mouseY = window.innerHeight / 2;
    let currentX = mouseX;
    let currentY = mouseY;

    // Track mouse pointer location
    window.addEventListener('mousemove', (e) => {
        mouseX = e.clientX;
        mouseY = e.clientY;
    });

    // Smooth movement interpolation
    function animateMouseLight() {
        // Ease towards target coordinates
        currentX += (mouseX - currentX) * 0.15;
        currentY += (mouseY - currentY) * 0.15;

        if (mouseLight) {
            mouseLight.style.transform = `translate3d(${currentX}px, ${currentY}px, 0)`;
        }

        requestAnimationFrame(animateMouseLight);
    }
    animateMouseLight();


    /* ==========================================
       2. HEADER SCROLL COLOR STABILITY FIX
       ========================================== */
    const header = document.getElementById('main-header');
    
    function handleHeaderScroll() {
        if (!header) return;
        if (window.scrollY > 30) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    }

    window.addEventListener('scroll', handleHeaderScroll);
    handleHeaderScroll();


    /* ==========================================
       3. COMPUTER SCREEN ANIMATED GIF SIMULATION
       ========================================== */
    const companyData = [
        {
            logo: "PXIL",
            name: "Power Exchange India Limited",
            sector: "Energy & Power Exchange",
            price: "₹1,450 / Sh",
            change: "+3.2% Live",
            valuation: "₹4,200 Cr",
            lot: "100 Shares",
            path: "M 0,90 Q 60,70 120,80 T 240,40 T 360,20 L 400,15"
        },
        {
            logo: "NCDEX",
            name: "National Comm. & Derivatives Exchange Ltd",
            sector: "Agri Commodity Exchange",
            price: "₹850 / Sh",
            change: "+2.1% Live",
            valuation: "₹3,100 Cr",
            lot: "200 Shares",
            path: "M 0,95 Q 80,60 160,75 T 280,30 L 400,25"
        },
        {
            logo: "STERLITE",
            name: "Sterlite Power Transmission Ltd.",
            sector: "Power Infrastructure & Grid",
            price: "₹620 / Sh",
            change: "+4.5% Live",
            valuation: "₹8,500 Cr",
            lot: "250 Shares",
            path: "M 0,85 Q 70,80 140,50 T 300,35 L 400,20"
        },
        {
            logo: "NERL",
            name: "National E-Repository Ltd.",
            sector: "Digital Repository & Agri Tech",
            price: "₹480 / Sh",
            change: "+1.9% Live",
            valuation: "₹1,800 Cr",
            lot: "300 Shares",
            path: "M 0,100 Q 50,85 150,60 T 320,40 L 400,10"
        },
        {
            logo: "RRP S4E",
            name: "RRP-S4E Innovation P.Ltd.",
            sector: "Electro-Optics & Defence Tech",
            price: "₹390 / Sh",
            change: "+5.8% Live",
            valuation: "₹1,200 Cr",
            lot: "500 Shares",
            path: "M 0,90 Q 90,65 180,45 T 310,25 L 400,12"
        },
        {
            logo: "GOODLUCK",
            name: "Goodluck Defence and Aerospace Ltd",
            sector: "Aerospace & Precision Tech",
            price: "₹1,120 / Sh",
            change: "+2.7% Live",
            valuation: "₹2,600 Cr",
            lot: "150 Shares",
            path: "M 0,80 Q 75,70 150,55 T 290,30 L 400,18"
        },
        {
            logo: "RITE WATER",
            name: "Rite Water Solutions (India) Limited",
            sector: "Clean Tech & Water Purification",
            price: "₹540 / Sh",
            change: "+3.4% Live",
            valuation: "₹1,950 Cr",
            lot: "200 Shares",
            path: "M 0,95 Q 65,75 140,60 T 300,35 L 400,15"
        },
        {
            logo: "PHARMED",
            name: "Pharmed Limited",
            sector: "Pharmaceuticals & Healthcare",
            price: "₹980 / Sh",
            change: "+4.0% Live",
            valuation: "₹3,400 Cr",
            lot: "200 Shares",
            path: "M 0,88 Q 85,60 170,48 T 330,22 L 400,10"
        }
    ];

    let currentIndex = 0;
    const heroWhiteCards = document.querySelectorAll('.hero-white-card');

    function updateComputerScreen(index) {
        heroWhiteCards.forEach((card, idx) => {
            card.classList.toggle('active', idx === index);
        });
    }

    // Auto Cycle Companies like a live GIF animation
    let autoCycleInterval = setInterval(() => {
        if (heroWhiteCards.length === 0) return;
        currentIndex = (currentIndex + 1) % heroWhiteCards.length;
        updateComputerScreen(currentIndex);
    }, 3800);

    // Hero white card manual click overrides
    heroWhiteCards.forEach((card, idx) => {
        card.addEventListener('click', () => {
            clearInterval(autoCycleInterval);
            currentIndex = idx;
            updateComputerScreen(currentIndex);
            // Restart cycle
            autoCycleInterval = setInterval(() => {
                if (heroWhiteCards.length === 0) return;
                currentIndex = (currentIndex + 1) % heroWhiteCards.length;
                updateComputerScreen(currentIndex);
            }, 3800);
        });
    });


    /* ==========================================
       4. MOBILE MENU & NAVIGATION SMOOTH SCROLL
       ========================================== */
    const hamburgerBtn = document.getElementById('hamburger-btn');
    const navMenu = document.getElementById('nav-menu');
    const navLinks = document.querySelectorAll('.nav-link');
    const dropdownToggles = document.querySelectorAll('.dropdown-toggle');
    const dropdownItems = document.querySelectorAll('.dropdown-item');

    if (hamburgerBtn && navMenu) {
        hamburgerBtn.addEventListener('click', () => {
            navMenu.classList.toggle('active');
        });
    }

    // Toggle dropdown in mobile view
    dropdownToggles.forEach(toggle => {
        toggle.addEventListener('click', (e) => {
            if (window.innerWidth <= 992) {
                // If clicked on mobile arrow / dropdown toggle, toggle sub-menu
                const parent = toggle.closest('.nav-dropdown');
                if (parent) {
                    if (!parent.classList.contains('mobile-open') || e.target.classList.contains('dropdown-caret')) {
                        e.preventDefault();
                        parent.classList.toggle('mobile-open');
                    }
                }
            }
        });
    });

    navLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            if (!link.classList.contains('dropdown-toggle') || window.innerWidth > 992) {
                if (navMenu) navMenu.classList.remove('active');
                navLinks.forEach(l => l.classList.remove('active'));
                link.classList.add('active');
            }
        });
    });

    dropdownItems.forEach(item => {
        item.addEventListener('click', () => {
            if (navMenu) navMenu.classList.remove('active');
            const serviceKey = item.getAttribute('data-service-key');
            if (serviceKey && typeof serviceDetailData !== 'undefined' && serviceDetailData[serviceKey]) {
                const serviceDetailModal = document.getElementById('service-detail-modal');
                if (serviceDetailModal) {
                    const modalIcon = document.getElementById('detail-icon');
                    const modalTitle = document.getElementById('detail-title');
                    const modalOverview = document.getElementById('detail-overview');
                    const modalProcess = document.getElementById('detail-process');
                    const modalDocs = document.getElementById('detail-docs');
                    const modalNotes = document.getElementById('detail-notes');
                    const data = serviceDetailData[serviceKey];
                    
                    if (modalIcon) modalIcon.textContent = data.icon;
                    if (modalTitle) modalTitle.textContent = data.title;
                    if (modalOverview) modalOverview.textContent = data.overview;
                    if (modalNotes) modalNotes.textContent = data.notes;
                    if (modalProcess) modalProcess.innerHTML = data.process.map(step => `<li>${step}</li>`).join('');
                    if (modalDocs) modalDocs.innerHTML = data.documents.map(doc => `<li>${doc}</li>`).join('');
                    
                    serviceDetailModal.classList.add('active');
                }
            }
        });
    });


    /* ==========================================
       5. ALLOCATION MODAL POPUP
       ========================================== */
    const modal = document.getElementById('allocation-modal');
    const modalCloseBtn = document.getElementById('modal-close-btn');
    const triggerBtns = document.querySelectorAll('.trigger-modal');
    const modalCompanyTitle = document.getElementById('modal-company-title');
    const modalForm = document.getElementById('modal-form');

    triggerBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const company = btn.getAttribute('data-company') || 'Selected Equity';
            if (modalCompanyTitle) {
                modalCompanyTitle.textContent = `Inquire Allocation: ${company}`;
            }
            // Close any open service drawer so the enquiry modal is front-and-center
            const openDrawer = document.getElementById('service-detail-modal');
            if (openDrawer && openDrawer.classList.contains('active')) {
                openDrawer.classList.remove('active');
            }
            const successAlert = document.getElementById('modal-success-alert');
            if (successAlert) successAlert.style.display = 'none';
            if (modalForm) modalForm.style.display = 'block';

            if (modal) modal.classList.add('active');
        });
    });

    if (modalCloseBtn) {
        modalCloseBtn.addEventListener('click', () => {
            if (modal) modal.classList.remove('active');
        });
    }

    if (modal) {
        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.classList.remove('active');
            }
        });
    }

    // Auto-open allocation modal if query params or hash are present on services page
    function handleServicesUrlParams() {
        try {
            const isServicesPage = window.location.pathname.includes('services.html');
            if (!isServicesPage) return;

            const urlParams = new URLSearchParams(window.location.search);
            const action = (urlParams.get('action') || '').toLowerCase();
            const hash = (window.location.hash || '').toLowerCase();
            if (action === 'buy' || hash === '#buy' || hash === '#inquire-buy') {
                if (modalCompanyTitle) modalCompanyTitle.textContent = 'Inquire Allocation: Buy Pre-IPO & Unlisted Shares Desk';
                if (modal) modal.classList.add('active');
            } else if (action === 'sell' || hash === '#sell' || hash === '#inquire-sell') {
                if (modalCompanyTitle) modalCompanyTitle.textContent = 'Inquire Allocation: Sell Unlisted Shares Desk';
                if (modal) modal.classList.add('active');
            } else if (action === 'enquire' || hash === '#enquire') {
                if (modalCompanyTitle) modalCompanyTitle.textContent = 'Inquire Allocation: Private Market Desk';
                if (modal) modal.classList.add('active');
            }
        } catch (e) {
            console.error('Error handling services params:', e);
        }
    }
    handleServicesUrlParams();

    /**
     * Helper to dispatch form submissions directly to contact.meeraassociates@gmail.com
     * via FormSubmit.co AJAX API.
     */
    async function submitMeeraFormToEmail(payload, submitBtn, successMsg, onComplete) {
        const originalBtnHTML = submitBtn ? submitBtn.innerHTML : '';
        if (submitBtn) {
            submitBtn.disabled = true;
            submitBtn.innerHTML = '<span>⏳ Sending Enquiry...</span>';
        }

        const endpoint = 'https://formsubmit.co/ajax/contact.meeraassociates@gmail.com';

        try {
            const bodyData = {
                ...payload,
                _subject: payload._subject || `New Website Enquiry - Meera Associates (${payload['Full Name'] || 'Investor'})`,
                _template: 'table',
                _captcha: 'false'
            };
            if (payload['Email Address'] || payload.email || payload.Email) {
                bodyData._replyto = payload['Email Address'] || payload.email || payload.Email;
            }

            const response = await fetch(endpoint, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'Accept': 'application/json'
                },
                body: JSON.stringify(bodyData)
            });

            if (response.ok) {
                if (typeof onComplete === 'function') onComplete(true);
            } else {
                throw new Error('Server returned status: ' + response.status);
            }
        } catch (err) {
            console.warn('Form submission notice:', err);
            if (typeof onComplete === 'function') onComplete(false);
        } finally {
            if (submitBtn) {
                submitBtn.disabled = false;
                submitBtn.innerHTML = originalBtnHTML;
            }
        }
    }

    if (modalForm) {
        modalForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const submitBtn = modalForm.querySelector('button[type="submit"]');
            
            // Flexible input extraction
            const nameInput = modalForm.querySelector('input[name="name"], input[placeholder*="Name"]');
            const phoneInput = modalForm.querySelector('input[name="phone"], input[type="tel"], input[placeholder*="Mobile"], input[placeholder*="Phone"]');
            const emailInput = modalForm.querySelector('input[name="email"], input[type="email"]');
            const reqInput = modalForm.querySelector('input[name="requirement"], textarea[name="requirement"], textarea');

            const name = (nameInput?.value || '').trim();
            const phone = (phoneInput?.value || '').trim();
            const email = (emailInput?.value || '').trim();
            const requirement = (reqInput?.value || '').trim();
            const company = modalCompanyTitle ? modalCompanyTitle.textContent.replace('Inquire Allocation:', '').replace('Connect with Meera Associates', 'General Advisory').trim() : 'Unlisted Equity';

            const payload = {
                _subject: `Services Enquiry Desk: ${company} - ${name}`,
                "Target Requirement / Desk": company,
                "Full Name": name,
                "Mobile Phone": phone,
                "Source Page": window.location.pathname || "Services & Advisory Page",
                "Submission Time": new Date().toLocaleString('en-IN', { timeZone: 'Asia/Kolkata' })
            };
            if (email) payload["Email Address"] = email;
            if (requirement) payload["Requirement Details"] = requirement;

            await submitMeeraFormToEmail(
                payload,
                submitBtn,
                null,
                () => {
                    const successAlert = document.getElementById('modal-success-alert');
                    if (successAlert) {
                        successAlert.style.display = 'block';
                        modalForm.style.display = 'none';
                        setTimeout(() => {
                            if (modal) modal.classList.remove('active');
                            modalForm.reset();
                            modalForm.style.display = 'block';
                            successAlert.style.display = 'none';
                        }, 4000);
                    } else {
                        alert(`Thank you! Your enquiry for "${company}" has been sent to our advisory desk (contact.meeraassociates@gmail.com). Our team will contact you shortly.`);
                        if (modal) modal.classList.remove('active');
                        modalForm.reset();
                    }
                }
            );
        });
    }

    const inquiryForm = document.getElementById('inquiry-form');
    if (inquiryForm) {
        inquiryForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const submitBtn = inquiryForm.querySelector('button[type="submit"]');
            const name = (document.getElementById('fullname')?.value || '').trim();
            const email = (document.getElementById('email')?.value || '').trim();
            const phone = (document.getElementById('phone')?.value || '').trim();
            const interest = (document.getElementById('interested-scrip')?.value || '').trim();

            const payload = {
                _subject: `Priority Allocation Request: ${name}`,
                "Full Name": name,
                "Email Address": email,
                "Phone / WhatsApp": phone,
                "Share Your Interest": interest || 'General Private Equity Interest',
                "Source Page": "Home Page (Priority Allocation Form)",
                "Submission Time": new Date().toLocaleString('en-IN', { timeZone: 'Asia/Kolkata' })
            };

            await submitMeeraFormToEmail(
                payload,
                submitBtn,
                null,
                () => {
                    const alertEl = document.getElementById('inquiry-success-alert');
                    if (alertEl) {
                        alertEl.style.display = 'block';
                        alertEl.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                    } else {
                        alert("Priority allocation request submitted successfully! Your details have been emailed to our advisory desk (contact.meeraassociates@gmail.com).");
                    }
                    inquiryForm.reset();
                }
            );
        });
    }

    const contactPageForm = document.getElementById('contact-page-form');
    if (contactPageForm) {
        contactPageForm.addEventListener('submit', async (e) => {
            e.preventDefault();
            const submitBtn = contactPageForm.querySelector('button[type="submit"]');
            const name = (document.getElementById('contact-name')?.value || '').trim();
            const phone = (document.getElementById('contact-phone')?.value || '').trim();
            const email = (document.getElementById('contact-email')?.value || '').trim();
            const subject = (document.getElementById('contact-subject')?.value || '').trim();
            const message = (document.getElementById('contact-message')?.value || '').trim();

            const payload = {
                _subject: `New Contact Enquiry: ${subject || 'General'} - ${name}`,
                "Full Name": name,
                "Mobile Number": phone,
                "Email Address": email,
                "Enquiry Subject": subject,
                "Message Details": message,
                "Source Page": "Contact Us Page",
                "Submission Time": new Date().toLocaleString('en-IN', { timeZone: 'Asia/Kolkata' })
            };

            await submitMeeraFormToEmail(
                payload,
                submitBtn,
                null,
                () => {
                    const alertEl = document.getElementById('contact-success-alert');
                    if (alertEl) {
                        alertEl.style.display = 'block';
                        alertEl.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
                    } else {
                        alert("Thank you for contacting Meera Associates! Your enquiry has been received and emailed to our desk (contact.meeraassociates@gmail.com). Our team will get in touch with you shortly.");
                    }
                    contactPageForm.reset();
                }
            );
        });
    }

    /* ==========================================
       6. DETAILED SERVICE MODAL POPUP
       ========================================== */
    const serviceDetailData = {
        "unlisted-shares": {
            icon: "📈",
            title: "Buy & Sell Pre-IPO & Unlisted Shares",
            overview: "Transparent, secure, and rapid off-market execution for private market equities, connecting buyers and sellers with end-to-end Demat delivery and 24-hour target processing timelines.",
            process: [
                "Scrip Selection & Valuation Inquiry.",
                "Deal Finalization & Price Confirmation.",
                "Demat CML Verification & DIS Execution.",
                "Demat Credit & Same-Day Bank Settlement."
            ],
            documents: [
                "Client Master List (CML) signed/stamped by DP",
                "Self-Attested PAN Card Copy",
                "Delivery Instruction Slip (DIS) / e-DIS authorization",
                "Bank Account Proof (Cancelled Cheque / Bank Statement)",
                "Online Stamp Duty Payment Receipt"
            ],
            notes: "Private market transactions are executed through off-market depository transfer mechanisms in full compliance with SEBI and Depository guidelines."
        },
        "demat-shares": {
            icon: "📜",
            title: "Dematerialization of Physical Shares",
            overview: "Assistance with the process of converting eligible physical securities into electronic Demat form through coordination with Depository Participants and Registrars & Transfer Agents.",
            process: [
                "Portfolio Scrutiny & Verification of physical share certificates.",
                "Form Preparation (Dematerialisation Request Form - DRF).",
                "Certificate Surrender & Defacing as per regulatory protocols.",
                "RTA Verification & Direct Demat Credit to BO ID."
            ],
            documents: [
                "Original physical share certificates",
                "Dematerialisation Request Form (DRF) duly signed",
                "Applicable identity/KYC documents (PAN & Aadhaar)",
                "Client Master List (CML) / Demat statement",
                "Additional documents where required for name mismatch or lost certificates"
            ],
            notes: "Processing timelines depend on RTA verification and company registrar schedules. All physical documents must match Demat account holder names."
        },
        "iepf-recovery": {
            icon: "⚖️",
            title: "IEPF Recovery",
            overview: "Assistance with tracing eligible dormant assets and navigating the applicable IEPF claim process for unclaimed shares and dividends.",
            process: [
                "Asset Tracing & Entitlement Verification across MCA & company registers.",
                "IEPF-5 Online Filing & e-form generation.",
                "Physical Dossier Submission to Nodal Officer of the company.",
                "Verification by Nodal Officer & Asset Release by IEPF Authority."
            ],
            documents: [
                "IEPF-5 submission confirmation acknowledgement",
                "Indemnity Bond on non-judicial stamp paper",
                "Advance Stamped Receipt",
                "Proof of entitlement (Original share certificates / Dividend warrants)",
                "PAN & Address Proof self-attested",
                "Bank proof (Cancelled cheque with name printed)",
                "Client Master List (CML) of Demat Account",
                "Additional legal-heir documents where applicable (Succession Certificate/Probate)"
            ],
            notes: "IEPF claims undergo multi-tier verification by company nodal officers and the MCA IEPF Authority."
        },
        "ipo-capital": {
            icon: "🔔",
            title: "IPO Facilitation & Capital Raising",
            overview: "Structured support for primary-market participation and capital-raising requirements across Mainboard and SME opportunities.",
            process: [
                "Issue Analysis & Prospectus Review.",
                "Category & Bidding Process guidance (HNI, Retail, Corporate).",
                "Capital-Raising / Syndication Support for growth-stage businesses.",
                "Allotment Tracking & Listing Day Coordination."
            ],
            documents: [
                "Active Demat Client Master List (CML)",
                "PAN Card",
                "Applicable bank / ASBA / UPI details",
                "Corporate & Financial documents for institutional fundraising where applicable"
            ],
            notes: "All IPO applications are executed via bank ASBA or UPI mechanisms compliant with SEBI guidelines."
        },
        "mutual-funds": {
            icon: "💼",
            title: "Mutual Funds & Wealth Allocation",
            overview: "Mutual-fund and wealth-allocation solutions designed around investment objectives, liquidity requirements, and risk considerations.",
            process: [
                "Risk Profiling & Goal Mapping.",
                "Fund Selection across equity, debt, and hybrid categories.",
                "Digital Execution & Systematic Investment Setup.",
                "Portfolio Monitoring & Periodic Rebalancing."
            ],
            documents: [
                "PAN Card",
                "Applicable KYC documents (Aadhaar / Passport / Voter ID)",
                "Bank Account Proof (Cancelled Cheque / Statement)",
                "Photograph / Digital Video KYC",
                "FATCA / UBO declarations where applicable"
            ],
            notes: "Mutual fund investments are subject to market risks. We assist clients in matching fund strategies to risk profiles."
        },
        "bonds-fixed": {
            icon: "🏦",
            title: "Bonds & Fixed-Income Securities",
            overview: "Fixed-income solutions across applicable sovereign, PSU, and corporate securities designed for income and capital preservation.",
            process: [
                "Yield Analysis & Scrip Selection based on credit rating and tenure.",
                "Order Placement & Counterparty Matching.",
                "Settlement & Allocation via depository off-market mechanism.",
                "Coupon Receipt Tracking & Maturity Management."
            ],
            documents: [
                "Demat Client Master List (CML)",
                "Self-Attested PAN Card",
                "Bank Account Proof",
                "Address Proof"
            ],
            notes: "Fixed income yields and coupon payouts are subject to issuer credit terms and statutory tax deductions where applicable."
        },
        "insurance-solutions": {
            icon: "🛡️",
            title: "Insurance Solutions",
            overview: "Life, health, and corporate insurance solutions designed around protection and risk-management requirements.",
            process: [
                "Risk Assessment & Coverage Gap Analysis.",
                "Plan Comparison across leading insurance providers.",
                "Medical Underwriting Support & Proposal Filing.",
                "Policy Issuance & Renewal Support."
            ],
            documents: [
                "Self-Attested PAN Card",
                "Applicable Identity & Address Proof",
                "Income Proof (ITR / Form 16 / Salary Slips) where required",
                "Bank Account Proof",
                "Medical Reports where applicable",
                "Corporate documents for Keyman Insurance where applicable"
            ],
            notes: "Insurance policy terms, underwriting guidelines, and claims are subject to insurance company policy conditions."
        },
        "brokerage-las": {
            icon: "💳",
            title: "Equity Brokerage & Loan Against Securities",
            overview: "Capital-market services and liquidity facilities against eligible securities, subject to applicable eligibility, valuation, and lending terms.",
            process: [
                "Portfolio Valuation & Margin Assessment of eligible securities.",
                "Trading / Pledge Setup with authorized lending partners.",
                "Credit Facility Processing & Limit Sanction.",
                "Servicing & Repayment Management."
            ],
            documents: [
                "Demat Holding Statement / Client Master List (CML)",
                "Self-Attested PAN Card",
                "Address Proof",
                "Bank Statements (6 months) where required",
                "Applicable Loan Agreement and Pledge Documentation"
            ],
            notes: "Loan Against Securities facilities are provided through regulated NBFC/Banking partners subject to margin and LTV norms."
        }
    };

    const serviceDetailModal = document.getElementById('service-detail-modal');
    const serviceDetailClose = document.getElementById('service-detail-close');
    const viewServiceBtns = document.querySelectorAll('.view-service-btn');
    const modalIcon = document.getElementById('detail-icon');
    const modalTitle = document.getElementById('detail-title');
    const modalOverview = document.getElementById('detail-overview');
    const modalProcess = document.getElementById('detail-process');
    const modalDocs = document.getElementById('detail-docs');
    const modalNotes = document.getElementById('detail-notes');

    viewServiceBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            const key = btn.getAttribute('data-service-key');
            if (serviceDetailData[key]) {
                const data = serviceDetailData[key];
                if (modalIcon) modalIcon.textContent = data.icon;
                if (modalTitle) modalTitle.textContent = data.title;
                if (modalOverview) modalOverview.textContent = data.overview;
                if (modalNotes) modalNotes.textContent = data.notes;
                
                if (modalProcess) {
                    modalProcess.innerHTML = data.process.map(step => `<li>${step}</li>`).join('');
                }
                if (modalDocs) {
                    modalDocs.innerHTML = data.documents.map(doc => `<li>${doc}</li>`).join('');
                }
                // Set the inquiry button inside the drawer to the specific service
                const drawerInquireBtn = serviceDetailModal?.querySelector('.trigger-modal');
                if (drawerInquireBtn) {
                    drawerInquireBtn.setAttribute('data-company', data.title);
                }
                
                if (serviceDetailModal) serviceDetailModal.classList.add('active');
            }
        });
    });

    if (serviceDetailClose) {
        serviceDetailClose.addEventListener('click', () => {
            if (serviceDetailModal) serviceDetailModal.classList.remove('active');
        });
    }

    if (serviceDetailModal) {
        serviceDetailModal.addEventListener('click', (e) => {
            if (e.target === serviceDetailModal) {
                serviceDetailModal.classList.remove('active');
            }
        });
    }

    /* ==========================================
       FACTS COUNTER ANIMATION (DYNAMIC INCREASING VALUES)
       ========================================== */
    function initFactsCounters() {
        const counterElements = document.querySelectorAll('.fact-counter');
        if (!counterElements.length) return;

        let isAnimating = false;
        let animationDone = false;

        // Reset all counters strictly to 0
        function resetCountersToZero() {
            counterElements.forEach(counter => {
                const prefix = counter.getAttribute('data-prefix') || '';
                counter.textContent = `${prefix}0`;
            });
            animationDone = false;
        }

        function startCountUp() {
            if (isAnimating) return;
            isAnimating = true;

            const duration = 2000; // 2.0 seconds smooth, active movement
            const startTime = performance.now();

            // Ensure strictly starts from 0
            resetCountersToZero();

            function updateTick(currentTime) {
                const elapsed = currentTime - startTime;
                const progress = Math.min(elapsed / duration, 1);

                // Smooth quadratic ease-out: active, visible movement throughout from start to finish
                const ease = 1 - (1 - progress) * (1 - progress);

                counterElements.forEach(counter => {
                    const target = parseInt(counter.getAttribute('data-target'), 10) || 0;
                    const prefix = counter.getAttribute('data-prefix') || '';
                    const suffix = counter.getAttribute('data-suffix') || '';
                    const isComma = counter.getAttribute('data-format') === 'comma';

                    if (progress < 1) {
                        // While moving: actively count upwards from 0
                        const currentVal = Math.floor(ease * target);
                        let formatted = currentVal.toString();
                        if (isComma) {
                            formatted = currentVal.toLocaleString('en-IN');
                        }
                        counter.textContent = `${prefix}${formatted}`;
                    } else {
                        // When target arrived: display the final correct value with suffix
                        let finalFormatted = target.toString();
                        if (isComma) {
                            finalFormatted = target.toLocaleString('en-IN');
                        }
                        counter.textContent = `${prefix}${finalFormatted}${suffix}`;
                    }
                });

                if (progress < 1) {
                    requestAnimationFrame(updateTick);
                } else {
                    isAnimating = false;
                    animationDone = true;
                }
            }

            requestAnimationFrame(updateTick);
        }

        // Initialize display to 0 immediately
        resetCountersToZero();

        const factsSection = document.getElementById('facts') || document.querySelector('.facts-section');
        if (factsSection && 'IntersectionObserver' in window) {
            const observer = new IntersectionObserver((entries) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        if (!isAnimating && !animationDone) {
                            startCountUp();
                        }
                    } else {
                        // When scrolled far away, reset to 0 so coming back re-plays the count-up
                        if (animationDone) {
                            resetCountersToZero();
                        }
                    }
                });
            }, { threshold: 0.08, rootMargin: '0px 0px -20px 0px' });

            observer.observe(factsSection);
        } else {
            // Fallback for browsers without IntersectionObserver
            setTimeout(startCountUp, 400);
        }
    }

    initFactsCounters();

    /* ==========================================
       13. 7-SECOND BULL INTRO SCREEN CONTROLLER
       ========================================== */
    function initScreenBullIntro() {
        const bullOverlay = document.getElementById('screen-bull-overlay');
        if (!bullOverlay) return;

        const progressBar = document.getElementById('bull-progress-bar');
        const countdownEl = document.getElementById('bull-countdown');
        const skipBtn = document.getElementById('bull-skip-btn');
        const disclaimerModal = document.getElementById('disclaimer-modal');

        let isDismissed = false;
        let countdownTimer = null;
        let totalMs = 7000;
        let startTime = null;

        function dismissBullOverlay() {
            if (isDismissed) return;
            isDismissed = true;
            if (countdownTimer) {
                cancelAnimationFrame(countdownTimer);
                countdownTimer = null;
            }

            bullOverlay.classList.add('bull-fade-out');
            setTimeout(() => {
                bullOverlay.style.display = 'none';
            }, 850);
        }

        function runCountdown() {
            if (isDismissed) return;
            startTime = performance.now();

            function tick(now) {
                if (isDismissed) return;
                const elapsed = now - startTime;
                const progress = Math.min(elapsed / totalMs, 1);

                if (progressBar) {
                    progressBar.style.width = (progress * 100).toFixed(2) + '%';
                }

                if (countdownEl) {
                    const remainingSec = Math.max(0, Math.ceil((totalMs - elapsed) / 1000));
                    countdownEl.textContent = `${remainingSec}s`;
                }

                if (elapsed >= totalMs) {
                    dismissBullOverlay();
                } else {
                    countdownTimer = requestAnimationFrame(tick);
                }
            }

            countdownTimer = requestAnimationFrame(tick);
        }

        // Allow immediate skip via button or click anywhere on the splash overlay
        if (skipBtn) {
            skipBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                dismissBullOverlay();
            });
        }

        bullOverlay.addEventListener('click', () => {
            dismissBullOverlay();
        });

        // If disclaimer modal is currently open, wait until user confirms disclaimer to start the 7s countdown
        if (disclaimerModal && disclaimerModal.classList.contains('active')) {
            const onAccepted = () => {
                window.removeEventListener('meera:disclaimerAccepted', onAccepted);
                // Slight pause after modal fade to smoothly start the 7s bull countdown
                setTimeout(runCountdown, 250);
            };
            window.addEventListener('meera:disclaimerAccepted', onAccepted);
        } else {
            // No disclaimer active; run countdown right away
            // Give 150ms for initial DOM paint
            setTimeout(runCountdown, 150);
        }
    }

    initScreenBullIntro();

});
