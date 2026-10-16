# Script to apply standardized Header, Hero section, and Canonical Footer across the 5 newly added profiles

$standardHeader = @'
    <!-- 1. NAVIGATION HEADER (Standardized Parity) -->
    <header class="navbar" id="main-header">
        <div class="nav-container">
            <a href="../../index.html" class="logo" aria-label="Meera Associates">
                <img src="../../assets/meera_associates_logo.png" alt="Meera Associates" class="site-logo-img">
            </a>
            
            <nav class="nav-menu" id="nav-menu">
                <a href="../../index.html" class="nav-link">Home</a>
                <a href="../../about.html" class="nav-link">About Us</a>
                
                <div class="nav-dropdown">
                    <a href="../../services.html" class="nav-link dropdown-toggle">
                        Services <span class="dropdown-caret">▾</span>
                    </a>
                    <div class="dropdown-menu">
                        <a href="../../services.html#overview" class="dropdown-item">
                            <span class="dropdown-icon">📈</span>
                            <span class="dropdown-title">Buy &amp; Sell Pre-IPO &amp; Unlisted Shares</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="demat-shares">
                            <span class="dropdown-icon">📜</span>
                            <span class="dropdown-title">Dematerialization of Physical Shares</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="iepf-recovery">
                            <span class="dropdown-icon">⚖️</span>
                            <span class="dropdown-title">IEPF Recovery</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="ipo-capital">
                            <span class="dropdown-icon">🔔</span>
                            <span class="dropdown-title">IPO Facilitation &amp; Capital Raising</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="mutual-funds">
                            <span class="dropdown-icon">💼</span>
                            <span class="dropdown-title">Mutual Funds &amp; Wealth Allocation</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="bonds-fixed">
                            <span class="dropdown-icon">🏦</span>
                            <span class="dropdown-title">Bonds &amp; Fixed-Income Securities</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="insurance-solutions">
                            <span class="dropdown-icon">🛡️</span>
                            <span class="dropdown-title">Insurance Solutions</span>
                        </a>
                        <a href="../../services.html#all-services" class="dropdown-item" data-service-key="brokerage-las">
                            <span class="dropdown-icon">💳</span>
                            <span class="dropdown-title">Equity Brokerage &amp; Loan Against Securities</span>
                        </a>
                    </div>
                </div>
                
                <a href="../../unlisted-shares.html" class="nav-link active">Unlisted Shares</a>
                <a href="../../upcoming-ipos.html" class="nav-link">Upcoming IPO's</a>
                
                <div class="nav-dropdown">
                    <a href="../../resources.html" class="nav-link dropdown-toggle">
                        Media <span class="dropdown-caret">▾</span>
                    </a>
                    <div class="dropdown-menu resources-dropdown-menu">
                        <a href="../../blogs.html" class="dropdown-item">
                            <span class="dropdown-icon">📝</span>
                            <span class="dropdown-title">Blogs</span>
                        </a>
                        <a href="../../news.html" class="dropdown-item">
                            <span class="dropdown-icon">📰</span>
                            <span class="dropdown-title">News</span>
                        </a>
                        <a href="../../videos.html" class="dropdown-item">
                            <span class="dropdown-icon">🎥</span>
                            <span class="dropdown-title">Videos</span>
                        </a>
                    </div>
                </div>

                <a href="../../contact.html" class="nav-link">Contact Us</a>

                <!-- Social Media Channels in Header -->
                <div class="nav-social-links" aria-label="Social Media Links">
                    <a href="https://www.instagram.com/meeraassociates_mpspl/" target="_blank" rel="noopener noreferrer" class="nav-social-link nav-social-instagram" aria-label="Instagram" title="Follow us on Instagram">
                        <svg width="19" height="19" viewBox="0 0 24 24" fill="currentColor" class="nav-social-svg">
                            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                        </svg>
                    </a>
                    <a href="https://www.youtube.com/@MeeraAssociates-j2z" target="_blank" rel="noopener noreferrer" class="nav-social-link nav-social-youtube" aria-label="YouTube" title="Watch our YouTube Channel">
                        <svg width="19" height="19" viewBox="0 0 24 24" fill="currentColor" class="nav-social-svg">
                            <path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/>
                        </svg>
                    </a>
                    <a href="https://www.facebook.com/meeraassociates/" target="_blank" rel="noopener noreferrer" class="nav-social-link nav-social-facebook" aria-label="Facebook" title="Follow us on Facebook">
                        <svg width="19" height="19" viewBox="0 0 24 24" fill="currentColor" class="nav-social-svg">
                            <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/>
                        </svg>
                    </a>
                    <a href="https://www.linkedin.com/in/meera-associates/" target="_blank" rel="noopener noreferrer" class="nav-social-link nav-social-linkedin" aria-label="LinkedIn" title="Connect with us on LinkedIn">
                        <svg width="16" height="16" viewBox="0 0 24 24" fill="currentColor" class="nav-social-svg"><path d="M4.98 3.5c0 1.381-1.11 2.5-2.48 2.5s-2.48-1.119-2.48-2.5c0-1.38 1.11-2.5 2.48-2.5s2.48 1.12 2.48 2.5zm.02 4.5h-5v16h5v-16zm7.982 0h-4.968v16h4.969v-8.399c0-4.67 6.029-5.052 6.029 0v8.399h4.988v-10.131c0-7.88-8.922-7.593-11.018-3.714v-2.155z"/></svg>
                    </a>
                </div>
            </nav>

            <div class="nav-actions">
                <button class="hamburger" id="hamburger-btn" aria-label="Toggle Menu">
                    <span></span>
                    <span></span>
                    <span></span>
                </button>
            </div>
        </div>
    </header>
'@

$standardFooter = @'
    <!-- 4. CANONICAL FOOTER (Standardized Parity) -->
    <footer class="footer">
        <div class="container footer-container">
            <!-- Col 1: Corporate Brand Identity -->
            <div class="footer-brand">
                <a href="../../index.html" class="logo" aria-label="Meera Associates">
                    <img src="../../assets/meera_associates_logo.png" alt="Meera Associates" class="site-logo-img">
                </a>
                <p class="footer-tagline">“Trust. Transparency. Long-Term Relationships.”</p>
                <p class="footer-desc">
                    Four decades of financial advisory and private equity leadership spearheaded by JasbirSingh Dhawda since 1985. Delivering seamless off-market Demat settlement, research accuracy, and client-first execution.
                </p>
                <div class="footer-social-wrap" aria-label="Social Channels">
                    <a href="https://wa.me/918983388881" target="_blank" rel="noopener noreferrer" class="footer-social-btn footer-social-wa" aria-label="WhatsApp" title="Chat on WhatsApp">
                        <svg class="wa-icon-svg" viewBox="0 0 448 512" width="18" height="18" fill="currentColor" aria-hidden="true"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
                    </a>
                    <a href="https://www.instagram.com/meeraassociates_mpspl/" target="_blank" rel="noopener noreferrer" class="footer-social-btn footer-social-instagram" aria-label="Instagram" title="Follow us on Instagram">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/></svg>
                    </a>
                    <a href="https://www.youtube.com/@MeeraAssociates-j2z" target="_blank" rel="noopener noreferrer" class="footer-social-btn footer-social-youtube" aria-label="YouTube" title="Watch our YouTube Channel">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M23.498 6.186a3.016 3.016 0 0 0-2.122-2.136C19.505 3.545 12 3.545 12 3.545s-7.505 0-9.377.505A3.017 3.017 0 0 0 .502 6.186C0 8.07 0 12 0 12s0 3.93.502 5.814a3.016 3.016 0 0 0 2.122 2.136c1.871.505 9.376.505 9.376.505s7.505 0 9.377-.505a3.015 3.015 0 0 0 2.122-2.136C24 15.93 24 12 24 12s0-3.93-.502-5.814zM9.545 15.568V8.432L15.818 12l-6.273 3.568z"/></svg>
                    </a>
                    <a href="https://www.facebook.com/meeraassociates/" target="_blank" rel="noopener noreferrer" class="footer-social-btn footer-social-facebook" aria-label="Facebook" title="Follow us on Facebook">
                        <svg width="18" height="18" viewBox="0 0 24 24" fill="currentColor"><path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z"/></svg>
                    </a>
                    <a href="https://www.linkedin.com/in/meera-associates/" target="_blank" rel="noopener noreferrer" class="footer-social-btn footer-social-linkedin" aria-label="LinkedIn" title="Connect with us on LinkedIn">
                        <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M4.98 3.5c0 1.381-1.11 2.5-2.48 2.5s-2.48-1.119-2.48-2.5c0-1.38 1.11-2.5 2.48-2.5s2.48 1.12 2.48 2.5zm.02 4.5h-5v16h5v-16zm7.982 0h-4.968v16h4.969v-8.399c0-4.67 6.029-5.052 6.029 0v8.399h4.988v-10.131c0-7.88-8.922-7.593-11.018-3.714v-2.155z"/></svg>
                    </a>
                </div>
            </div>

            <!-- Col 2: Quick Links -->
            <div class="footer-links">
                <h4>Quick Links</h4>
                <ul>
                    <li><a href="../../index.html">Home</a></li>
                    <li><a href="../../about.html">About Us</a></li>
                    <li><a href="../../services.html">Financial Services</a></li>
                    <li><a href="../../unlisted-shares.html">Unlisted Shares Directory</a></li>
                    <li><a href="../../upcoming-ipos.html">Upcoming IPO's</a></li>
                    <li><a href="../../resources.html">Media</a></li>
                    <li><a href="../../index.html#gallery">Our Gallery</a></li>
                    <li><a href="../../contact.html">Contact Us</a></li>
                </ul>
            </div>

            <!-- Col 3: Core Financial Solutions -->
            <div class="footer-links">
                <h4>Core Services</h4>
                <ul>
                    <li><a href="../../unlisted-shares.html">Buy &amp; Sell Unlisted Shares</a></li>
                    <li><a href="../../services.html#all-services">Dematerialization of Shares</a></li>
                    <li><a href="../../services.html#all-services">IEPF Recovery Assistance</a></li>
                    <li><a href="../../services.html#all-services">IPO &amp; Capital Raising</a></li>
                    <li><a href="../../services.html#all-services">Mutual Funds &amp; Allocation</a></li>
                    <li><a href="../../services.html#all-services">Bonds &amp; Fixed Income</a></li>
                    <li><a href="../../services.html#all-services">Equity Brokerage &amp; LAS</a></li>
                </ul>
            </div>

            <!-- Col 4: Direct Investor Desk & Contact -->
            <div class="footer-links footer-contact-col">
                <h4>Direct Investor Desk</h4>
                <ul class="footer-contact-list">
                    <li class="footer-contact-item">
                        <span class="f-icon">📞</span>
                        <div class="f-content">
                            <span class="f-label">Advisory Desk</span>
                            <div>
                                <a href="tel:+918983388881">+91 89833 88881</a> &nbsp;|&nbsp; 
                                <a href="tel:+918888415222">+91 88884 15222</a>
                            </div>
                        </div>
                    </li>
                    <li class="footer-contact-item">
                        <span class="f-icon f-icon-wa"><svg class="wa-icon-svg" viewBox="0 0 448 512" width="16" height="16" fill="currentColor" aria-hidden="true"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg></span>
                        <div class="f-content">
                            <span class="f-label">WhatsApp Priority</span>
                            <div>
                                <a href="https://wa.me/918983388881" target="_blank" rel="noopener" class="footer-link-wa">Message on WhatsApp</a>
                            </div>
                        </div>
                    </li>
                    <li class="footer-contact-item">
                        <span class="f-icon">☎️</span>
                        <div class="f-content">
                            <span class="f-label">Office Landline</span>
                            <div>
                                <a href="tel:+918446006200">+91 84460 06200</a>
                            </div>
                        </div>
                    </li>
                    <li class="footer-contact-item">
                        <span class="f-icon">✉️</span>
                        <div class="f-content">
                            <span class="f-label">Email Inquiries</span>
                            <div>
                                <a href="mailto:contact.meeraassociates@gmail.com">contact.meeraassociates@gmail.com</a>
                            </div>
                        </div>
                    </li>
                    <li class="footer-contact-item">
                        <span class="f-icon">📍</span>
                        <div class="f-content">
                            <span class="f-label">Head Office</span>
                            <span>Dashmesh Square, A Wing, 2nd Floor, Kalewadi, Pune - 411017</span>
                        </div>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Statutory Regulatory Notice & SEBI Compliance Disclaimer -->
        <div class="container footer-disclaimer-wrap">
            <div class="footer-disclaimer-card">
                <div class="footer-disclaimer-header">
                    <span class="f-disc-badge">Regulatory Notice</span>
                    <strong>Important Investor Information</strong>
                </div>
                <p>
                    Meera Associates operates as an independent private equity facilitation and financial consulting firm. Transactions in unlisted and pre-IPO securities are facilitated strictly through compliant off-market depository transfer mechanisms (NSDL / CDSL) between consenting parties. Unlisted investments are subject to market risks, illiquidity, and transfer procedures. This website is educational and informational in nature and does not constitute a public offer, recommendation, stock exchange trading portal, or solicitation to buy or sell securities. Investors are advised to consult SEBI-registered professionals before making financial decisions.
                </p>
            </div>
        </div>

        <!-- Footer Bottom Bar -->
        <div class="footer-bottom">
            <div class="container footer-bottom-container">
                <p class="copyright-text">&copy; 2026 Meera Associates. All Rights Reserved. Spearheaded by JasbirSingh Dhawda.</p>
                <div class="footer-bottom-links">
                    <a href="../../contact.html" class="f-bottom-link">Privacy &amp; Compliance</a>
                    <span class="f-sep">&bull;</span>
                    <a href="../../contact.html" class="f-bottom-link">Investor Helpdesk</a>
                    <span class="f-sep">&bull;</span>
                    <a href="#main-header" class="f-back-to-top" title="Back to top">Back to Top ↑</a>
                </div>
            </div>
        </div>
    </footer>
'@

$heroConfigs = @{
    "nerl" = @{
        Prefix = "nerl"
        BreadcrumbTitle = "National E-Repository Limited (NeRL)"
        BadgeIcon = "🌾"
        BadgeText = "Commodity Repository & Agritech FinTech"
        HeroTitle = "National E-Repository Limited"
        HeroSubtitle = "India’s premier electronic negotiable warehouse receipt (eNWR) repository promoted by National Commodity & Derivatives Exchange Limited (NCDEX) and National Bank for Agriculture and Rural Development (NABARD). Regulated by WDRA to digitalize India’s agricultural commodity pledge financing and electronic warehousing architecture."
        Card1Label = "📋 DEPOSITORY ISIN"
        Card1Val = "INE878X01013"
        Card1Sub = "NSDL / CDSL Demat Active"
        Card1ValStyle = 'style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;"'
        Card2Label = "🏛️ CORE PARENTAGE"
        Card2Val = "NCDEX & NABARD"
        Card2Sub = "ICICI Bank & SBI Backed"
        Card2ValStyle = ''
        Card3Label = "⚖️ REGULATORY STATUS"
        Card3Val = "WDRA Registered"
        Card3Sub = "Electronic Repository License"
        Card3ValStyle = ''
        Card4Label = "📦 DELIVERY MECHANISM"
        Card4Val = "Off-Market Transfer"
        Card4Sub = "DIS / CDSL Easiest Transfer"
        Card4ValStyle = ''
    }
    "nayaraenergy" = @{
        Prefix = "nayara"
        BreadcrumbTitle = "Nayara Energy Limited"
        BadgeIcon = "⛽"
        BadgeText = "Downstream Refining & Fuel Retail"
        HeroTitle = "Nayara Energy Limited"
        HeroSubtitle = "India’s second-largest single-site downstream petroleum refining and retail powerhouse (formerly Essar Oil Limited). Operates a world-class 20 MTPA refinery with an exceptional Nelson Complexity Index of 11.8 in Vadinar, Gujarat, supported by a pan-India network of over 6,000 retail fuel stations."
        Card1Label = "📋 DEPOSITORY ISIN"
        Card1Val = "INE011A01019"
        Card1Sub = "NSDL / CDSL Demat Active"
        Card1ValStyle = 'style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;"'
        Card2Label = "⛽ REFINERY CAPACITY"
        Card2Val = "20 MTPA"
        Card2Sub = "Nelson Complexity 11.8"
        Card2ValStyle = ''
        Card3Label = "🏪 RETAIL NETWORK"
        Card3Val = "6,000+ Outlets"
        Card3Sub = "Pan-India Fuel Franchise"
        Card3ValStyle = ''
        Card4Label = "📦 DELIVERY MECHANISM"
        Card4Val = "Off-Market Transfer"
        Card4Sub = "DIS / CDSL Easiest Transfer"
        Card4ValStyle = ''
    }
    "oyo" = @{
        Prefix = "oyo"
        BreadcrumbTitle = "Oravel Stays Limited (OYO Rooms)"
        BadgeIcon = "🏨"
        BadgeText = "Global Travel Tech & Hospitality Platform"
        HeroTitle = "Oravel Stays Limited (OYO Rooms)"
        HeroSubtitle = "India’s largest and the world’s leading travel technology and hospitality franchise platform founded by Ritesh Agarwal. Empowers hundreds of thousands of independent hotel and vacation home entrepreneurs with full-stack proprietary operating software across 35+ global markets."
        Card1Label = "📋 DEPOSITORY ISIN"
        Card1Val = "INE561T01021"
        Card1Sub = "NSDL / CDSL Demat Active"
        Card1ValStyle = 'style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;"'
        Card2Label = "🌍 GLOBAL SCALE"
        Card2Val = "35+ Countries"
        Card2Sub = "Europe, US, India, SE Asia"
        Card2ValStyle = ''
        Card3Label = "🏨 STOREFRONTS"
        Card3Val = "175,000+"
        Card3Sub = "Hotels & Homes Live"
        Card3ValStyle = ''
        Card4Label = "👑 FOUNDER & PROMOTER"
        Card4Val = "Ritesh Agarwal"
        Card4Sub = "SoftBank & Institutional Backed"
        Card4ValStyle = ''
    }
    "hdfcsecurities" = @{
        Prefix = "hdfcsec"
        BreadcrumbTitle = "HDFC Securities Limited"
        BadgeIcon = "📈"
        BadgeText = "Stock Broking & Wealth Distribution"
        HeroTitle = "HDFC Securities Limited"
        HeroSubtitle = "The trusted retail and institutional stock broking subsidiary of India’s largest private-sector lender, HDFC Bank. Operating since April 2000, serving over 27 lakh discerning investors across 216+ branch networks and cutting-edge digital capital market platforms."
        Card1Label = "📋 DEPOSITORY ISIN"
        Card1Val = "INE700G01014"
        Card1Sub = "NSDL / CDSL Demat Active"
        Card1ValStyle = 'style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;"'
        Card2Label = "🏛️ PARENTAGE"
        Card2Val = "HDFC Bank (95%+)"
        Card2Sub = "India’s Largest Private Bank"
        Card2ValStyle = ''
        Card3Label = "👥 CLIENTELE BASE"
        Card3Val = "27+ Lakhs"
        Card3Sub = "Active Retail & HNI Clients"
        Card3ValStyle = ''
        Card4Label = "🏢 BRANCH NETWORK"
        Card4Val = "216+ Branches"
        Card4Sub = "Pan-India Wealth Presence"
        Card4ValStyle = ''
    }
    "motilaloswalhf" = @{
        Prefix = "mohf"
        BreadcrumbTitle = "Motilal Oswal Home Finance Limited"
        BadgeIcon = "🏠"
        BadgeText = "Housing Finance & Mortgage Lending"
        HeroTitle = "Motilal Oswal Home Finance Limited"
        HeroSubtitle = "A premier retail housing finance institution registered with the National Housing Bank (NHB) and operating as a core subsidiary of Motilal Oswal Financial Services Limited (MOFSL). Delivering accessible, customer-centric home loans and mortgage credit solutions across 12 states in India."
        Card1Label = "📋 DEPOSITORY ISIN"
        Card1Val = "INE658R01011"
        Card1Sub = "NSDL / CDSL Demat Active"
        Card1ValStyle = 'style="font-size: 1.15rem; font-family: monospace; color: #38bdf8;"'
        Card2Label = "🏛️ CORE PARENT"
        Card2Val = "Motilal Oswal (MOFSL)"
        Card2Sub = "100% Flagship Ownership"
        Card2ValStyle = ''
        Card3Label = "💰 AUM BOOK"
        Card3Val = "₹4,000+ Cr"
        Card3Sub = "High Quality Loan Asset Base"
        Card3ValStyle = ''
        Card4Label = "📍 GEOGRAPHIC REACH"
        Card4Val = "12 States / 110+ Br"
        Card4Sub = "Deep Affordable Housing Reach"
        Card4ValStyle = ''
    }
}

foreach ($scrip in $heroConfigs.Keys) {
    $cfg = $heroConfigs[$scrip]
    $p = $cfg.Prefix
    $filePath = "scripts\$scrip\$scrip.html"
    $content = Get-Content $filePath -Raw -Encoding UTF8
    
    # 1. Replace Header
    $content = [regex]::Replace($content, '(?s)<header class="navbar" id="main-header">.*?</header>', $standardHeader)
    
    # 2. Build Hero Section HTML
    $heroHtml = @"
    <main class="$p-page-wrap">
        <!-- 2. HIGH-IMPACT COMMAND BAR HERO -->
        <section class="$p-hero">
            <div class="$p-hero-container">
                <!-- Breadcrumbs Navigation -->
                <nav class="$p-breadcrumbs" aria-label="Breadcrumb">
                    <a href="../../index.html">Home</a>
                    <span class="crumb-sep">/</span>
                    <a href="../../unlisted-shares.html">Unlisted Shares</a>
                    <span class="crumb-sep">/</span>
                    <span style="color: #ffffff; font-weight: 600;">$($cfg.BreadcrumbTitle)</span>
                </nav>

                <!-- Sector Pill Badge -->
                <div class="$p-hero-badge">
                    <span class="pulse-dot"></span>
                    $($cfg.BadgeIcon) $($cfg.BadgeText)
                </div>

                <!-- Main Hero Headline -->
                <h1 class="$p-hero-title">$($cfg.HeroTitle)</h1>
                <p class="$p-hero-subtitle">
                    $($cfg.HeroSubtitle)
                </p>

                <!-- 4-KPI Metric Strip in Hero -->
                <div class="$p-metrics-strip">
                    <div class="$p-metric-card">
                        <span class="$p-metric-label">$($cfg.Card1Label)</span>
                        <span class="$p-metric-value" $($cfg.Card1ValStyle)>$($cfg.Card1Val)</span>
                        <span class="$p-metric-sub">$($cfg.Card1Sub)</span>
                    </div>

                    <div class="$p-metric-card">
                        <span class="$p-metric-label">$($cfg.Card2Label)</span>
                        <span class="$p-metric-value" $($cfg.Card2ValStyle)>$($cfg.Card2Val)</span>
                        <span class="$p-metric-sub">$($cfg.Card2Sub)</span>
                    </div>

                    <div class="$p-metric-card">
                        <span class="$p-metric-label">$($cfg.Card3Label)</span>
                        <span class="$p-metric-value" $($cfg.Card3ValStyle)>$($cfg.Card3Val)</span>
                        <span class="$p-metric-sub">$($cfg.Card3Sub)</span>
                    </div>

                    <div class="$p-metric-card">
                        <span class="$p-metric-label">$($cfg.Card4Label)</span>
                        <span class="$p-metric-value" $($cfg.Card4ValStyle)>$($cfg.Card4Val)</span>
                        <span class="$p-metric-sub">$($cfg.Card4Sub)</span>
                    </div>
                </div>
            </div>
        </section>

        <!-- 3. COMPREHENSIVE 2-COLUMN MAIN VIEWPORT -->
        <div class="$p-main-grid">
"@
    
    # Replace from `<main class="$p-page-wrap">` through `<div class="$p-main-grid">`
    # or if it had `<div class="$p-main-container">\s*<div class="$p-main-grid">`
    $heroPattern = "(?s)<main class=""$p-page-wrap"">.*?<div class=""$p-main-grid"">"
    $content = [regex]::Replace($content, $heroPattern, $heroHtml)
    
    # 3. Remove the extra closing </div> that belonged to $p-main-container before </main>
    # Notice the pattern right before </main> was </div>\s*</div>\s*</main> (one for sidebar/grid, one for main-container)
    # Let's inspect that area:
    $content = [regex]::Replace($content, '(?s)(</div>\s*)</div>\s*(</main>)', '$1$2')
    
    # 4. Replace Footer
    $content = [regex]::Replace($content, '(?s)<footer class="footer">.*?</footer>', $standardFooter)
    
    # Write back in UTF-8 without BOM
    $utf8NoBom = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText((Resolve-Path $filePath), $content, $utf8NoBom)
    Write-Host "Updated $filePath successfully."
}
