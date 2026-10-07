/**
 * MEERA ASSOCIATES - MEERA AI ASSISTANT CHATBOT ENGINE (chatbot.js)
 * Production-ready intelligent assistant for Unlisted & Pre-IPO Shares transactions.
 */

(function () {
    'use strict';

    class MeeraChatbot {
        constructor() {
            this.kb = window.MEERA_KB || {};
            this.isOpen = false;
            this.isMinimized = false;
            this.history = [];
            this.isTyping = false;
            this.leadFormState = null;

            // Detect base path for nested subdirectories (e.g. scripts/ or scripts/company/)
            const scriptTag = document.querySelector('script[src*="chatbot.js"]');
            const srcAttr = scriptTag ? scriptTag.getAttribute('src') || '' : '';
            const matchDots = srcAttr.match(/^(\.\.\/)+/);
            this.basePath = matchDots ? matchDots[0] : '';
            this.waIconSvg = '<svg class="wa-icon-svg" viewBox="0 0 448 512" width="14" height="14" fill="currentColor" style="vertical-align: -2px; margin-right: 4px;" aria-hidden="true"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>';

            this.init();
        }

        get whatsappLink() {
            return (this.kb && this.kb.contact && this.kb.contact.whatsapp && this.kb.contact.whatsapp.link)
                ? this.kb.contact.whatsapp.link
                : 'https://wa.me/918983388881?text=Hello%20Meera%20Associates,%20I%20am%20interested%20in%20Unlisted%20Shares%20assistance.';
        }

        init() {
            if (document.getElementById('meera-chatbot-root')) return;
            this.renderDOM();
            this.cacheElements();
            this.bindEvents();
            this.sendInitialGreeting();
        }

        renderDOM() {
            const root = document.createElement('div');
            root.id = 'meera-chatbot-root';
            root.innerHTML = `
                <!-- Floating Launcher -->
                <div class="meera-chat-launcher" id="meera-chat-launcher" role="button" aria-label="Open Meera AI Chatbot" tabindex="0">
                    <div class="meera-launcher-pulse"></div>
                    <div class="meera-launcher-icon meera-launcher-open-icon">💬</div>
                    <div class="meera-launcher-icon meera-launcher-close-icon">&times;</div>
                    <span class="meera-launcher-tooltip">Chat with Meera AI</span>
                </div>

                <!-- Chat Window -->
                <div class="meera-chat-window" id="meera-chat-window" role="dialog" aria-modal="true" aria-label="Meera AI Assistant Chat Window">
                    <!-- Header -->
                    <div class="meera-chat-header">
                        <div class="meera-header-left">
                            <div class="meera-avatar">
                                <img src="${this.basePath}assets/meera_associates_logo.jpg" alt="Meera Associates" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;">
                                <div class="meera-avatar-online"></div>
                            </div>
                            <div class="meera-header-info">
                                <div class="meera-bot-name">
                                    Meera AI Assistant
                                    <span class="meera-bot-brand">Official</span>
                                </div>
                                <div class="meera-bot-status">
                                    <span class="status-dot"></span>
                                    <span>Typically replies instantly</span>
                                </div>
                            </div>
                        </div>

                        <div class="meera-header-actions">
                            <button class="meera-header-btn" id="meera-chat-clear" title="Clear Chat History">🗑️</button>
                            <button class="meera-header-btn" id="meera-chat-minimize" title="Minimize Chat">─</button>
                            <button class="meera-header-btn" id="meera-chat-close" title="Close Chat">&times;</button>
                        </div>
                    </div>

                    <!-- Chat Message Area -->
                    <div class="meera-chat-body" id="meera-chat-body"></div>

                    <!-- Quick Action Chips Bar -->
                    <div class="meera-chat-chips-area" id="meera-chat-chips-area">
                        <button class="meera-chips-nav-btn prev" id="meera-chips-prev" title="Scroll Left" aria-label="Scroll Left">‹</button>
                        <div class="meera-chips-scroll" id="meera-chips-scroll"></div>
                        <button class="meera-chips-nav-btn next" id="meera-chips-next" title="Scroll Right" aria-label="Scroll Right">›</button>
                    </div>

                    <!-- Input Bar -->
                    <div class="meera-chat-input-bar">
                        <div class="meera-input-wrapper">
                            <input type="text" class="meera-chat-input" id="meera-chat-input" placeholder="Ask about unlisted shares..." autocomplete="off">
                            <button class="meera-emoji-btn" id="meera-emoji-btn" title="Quick Questions">💡</button>
                        </div>
                        <button class="meera-chat-send-btn" id="meera-chat-send-btn" title="Send Message">
                            <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                                <line x1="22" y1="2" x2="11" y2="13"></line>
                                <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                            </svg>
                        </button>
                    </div>

                    <!-- Footer -->
                    <div class="meera-chat-footer">
                        <div class="meera-chat-footer-brand">
                            <strong>Meera Associates</strong> | Unlisted & Pre-IPO Share Assistance<br>
                            <a href="tel:+918983388881">+91 8983388881</a>
                        </div>
                    </div>
                </div>

                <!-- Floating WhatsApp Buttons (Chat Us & Join Us) Above Chatbot -->
                <div class="meera-wa-floating-stack" id="meera-wa-floating-stack" aria-label="WhatsApp Quick Actions">
                    <a href="https://chat.whatsapp.com/EqR5aav3bIRLp0HM69VYfu" target="_blank" rel="noopener noreferrer" class="meera-wa-fab-btn meera-wa-join-btn" aria-label="Join our WhatsApp Community" title="Join our WhatsApp Community">
                        <svg class="meera-wa-fab-icon" viewBox="0 0 448 512" width="18" height="18" fill="currentColor" aria-hidden="true"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
                        <span class="meera-wa-fab-text">Join Us</span>
                    </a>
                    <a href="https://wa.me/918983388881" target="_blank" rel="noopener noreferrer" class="meera-wa-fab-btn meera-wa-chat-btn" aria-label="Chat with Meera Associates on WhatsApp" title="Chat with us on WhatsApp">
                        <svg class="meera-wa-fab-icon" viewBox="0 0 448 512" width="18" height="18" fill="currentColor" aria-hidden="true"><path d="M380.9 97.1C339 55.1 283.2 32 223.9 32c-122.4 0-222 99.6-222 222 0 39.1 10.2 77.3 29.6 111L0 480l117.7-30.9c32.4 17.7 68.9 27 106.1 27h.1c122.3 0 224.1-99.6 224.1-222 0-59.3-25.2-115-67.1-157zm-157 341.6c-33.2 0-65.7-8.9-94-25.7l-6.7-4-69.8 18.3L72 359.2l-4.4-7c-18.5-29.4-28.2-63.3-28.2-98.2 0-101.7 82.8-184.5 184.6-184.5 49.3 0 95.6 19.2 130.4 54.1 34.8 34.9 56.2 81.2 56.1 130.5 0 101.8-84.9 184.6-186.6 184.6zm101.2-138.2c-5.5-2.8-32.8-16.2-37.9-18-5.1-1.9-8.8-2.8-12.5 2.8-3.7 5.6-14.3 18-17.6 21.8-3.2 3.7-6.5 4.2-12 1.4-32.6-16.3-54-29.1-75.5-66-5.7-9.8 5.7-9.1 16.3-30.3 1.8-3.7.9-6.9-.5-9.7-1.4-2.8-12.5-30.1-17.1-41.2-4.5-10.8-9.1-9.3-12.5-9.5-3.2-.2-6.9-.2-10.6-.2-3.7 0-9.7 1.4-14.8 6.9-5.1 5.6-19.4 19-19.4 46.3 0 27.3 19.9 53.7 22.6 57.4 2.8 3.7 39.1 59.7 94.8 83.8 35.2 15.2 49 16.5 66.6 13.9 10.7-1.6 32.8-13.4 37.4-26.4 4.6-13 4.6-24.1 3.2-26.4-1.3-2.5-5-3.9-10.5-6.6z"/></svg>
                        <span class="meera-wa-fab-text">Chat Us</span>
                    </a>
                </div>
            `;
            document.body.appendChild(root);
        }

        cacheElements() {
            this.launcher = document.getElementById('meera-chat-launcher');
            this.waStack = document.getElementById('meera-wa-floating-stack');
            this.window = document.getElementById('meera-chat-window');
            this.body = document.getElementById('meera-chat-body');
            this.input = document.getElementById('meera-chat-input');
            this.sendBtn = document.getElementById('meera-chat-send-btn');
            this.closeBtn = document.getElementById('meera-chat-close');
            this.minimizeBtn = document.getElementById('meera-chat-minimize');
            this.clearBtn = document.getElementById('meera-chat-clear');
            this.emojiBtn = document.getElementById('meera-emoji-btn');
            this.chipsScroll = document.getElementById('meera-chips-scroll');
            this.chipsPrev = document.getElementById('meera-chips-prev');
            this.chipsNext = document.getElementById('meera-chips-next');
        }

        bindEvents() {
            // Launcher toggle
            this.launcher.addEventListener('click', () => this.toggleChat());
            this.closeBtn.addEventListener('click', () => this.closeChat());
            this.minimizeBtn.addEventListener('click', () => this.toggleMinimize());
            this.clearBtn.addEventListener('click', () => this.clearChat());

            // Input handlers
            this.sendBtn.addEventListener('click', () => this.handleUserSubmit());
            this.input.addEventListener('keydown', (e) => {
                if (e.key === 'Enter' && !e.shiftKey) {
                    e.preventDefault();
                    this.handleUserSubmit();
                }
            });

            // Quick Question / Suggestion button
            this.emojiBtn.addEventListener('click', () => {
                this.handleQuickSelect('What are unlisted shares?');
            });

            // Chips navigation arrow buttons
            if (this.chipsPrev && this.chipsNext && this.chipsScroll) {
                this.chipsPrev.addEventListener('click', () => {
                    this.chipsScroll.scrollBy({ left: -160, behavior: 'smooth' });
                });
                this.chipsNext.addEventListener('click', () => {
                    this.chipsScroll.scrollBy({ left: 160, behavior: 'smooth' });
                });
            }

            // Chips horizontal wheel scroll & drag-to-scroll
            if (this.chipsScroll) {
                // Mouse wheel translates to horizontal scroll
                this.chipsScroll.addEventListener('wheel', (e) => {
                    if (e.deltaY !== 0) {
                        e.preventDefault();
                        this.chipsScroll.scrollLeft += e.deltaY;
                    }
                }, { passive: false });

                // Click and drag to scroll
                let isDown = false;
                let startX = 0;
                let scrollLeft = 0;
                let hasMoved = false;

                this.chipsScroll.addEventListener('mousedown', (e) => {
                    isDown = true;
                    hasMoved = false;
                    this.chipsScroll.classList.add('is-dragging');
                    startX = e.pageX - this.chipsScroll.offsetLeft;
                    scrollLeft = this.chipsScroll.scrollLeft;
                });

                window.addEventListener('mouseup', () => {
                    if (isDown) {
                        isDown = false;
                        this.chipsScroll.classList.remove('is-dragging');
                    }
                });

                this.chipsScroll.addEventListener('mousemove', (e) => {
                    if (!isDown) return;
                    e.preventDefault();
                    const x = e.pageX - this.chipsScroll.offsetLeft;
                    const walk = (x - startX) * 1.5;
                    if (Math.abs(walk) > 4) {
                        hasMoved = true;
                    }
                    this.chipsScroll.scrollLeft = scrollLeft - walk;
                });

                // Suppress chip click trigger if user was actually dragging
                this.chipsScroll.addEventListener('click', (e) => {
                    if (hasMoved) {
                        e.preventDefault();
                        e.stopPropagation();
                        hasMoved = false;
                    }
                }, true);
            }
        }

        toggleChat() {
            if (this.isOpen) {
                this.closeChat();
            } else {
                this.openChat();
            }
        }

        openChat() {
            this.isOpen = true;
            this.isMinimized = false;
            this.window.classList.add('active');
            this.window.classList.remove('minimized');
            this.launcher.classList.add('active');
            if (this.waStack) this.waStack.classList.add('hidden');
            setTimeout(() => this.input.focus(), 300);
            this.scrollToBottom();
        }

        closeChat() {
            this.isOpen = false;
            this.window.classList.remove('active');
            this.launcher.classList.remove('active');
            if (this.waStack) this.waStack.classList.remove('hidden');
        }

        toggleMinimize() {
            this.isMinimized = !this.isMinimized;
            this.window.classList.toggle('minimized', this.isMinimized);
        }

        clearChat() {
            this.body.innerHTML = '';
            this.history = [];
            this.sendInitialGreeting();
        }

        scrollToBottom() {
            setTimeout(() => {
                this.body.scrollTop = this.body.scrollHeight;
            }, 50);
        }

        sendInitialGreeting() {
            const welcomeText = `Hello! 👋 Welcome to Meera Associates. I’m Meera AI Assistant. How can I help you today?

I can help you understand unlisted & pre-IPO shares, transaction processes, company information, KYC, Demat requirements, and more.

What would you like to know?`;

            this.appendMessage('bot', welcomeText);
            this.renderQuickActionChips();
        }

        renderQuickActionChips() {
            const actions = [
                { label: "📈 Enquire Shares", query: "Enquire Shares", highlight: true },
                { label: "📊 Explore Unlisted Shares", query: "Explore Unlisted Shares" },
                { label: "🏢 Company Information", query: "Company Information" },
                { label: "💰 Buy Unlisted Shares", query: "How to buy unlisted shares" },
                { label: "🔄 Sell Unlisted Shares", query: "How to sell unlisted shares" },
                { label: "📋 KYC & Documents", query: "What documents are required for KYC" },
                { label: "💳 Demat Process", query: "Demat Process for unlisted shares" },
                { label: "📞 Contact Meera Associates", query: "Contact Meera Associates" }
            ];

            this.chipsScroll.innerHTML = actions.map(act => `
                <button class="meera-chip-btn ${act.highlight ? 'highlight' : ''}" data-query="${act.query}">
                    ${act.label}
                </button>
            `).join('');

            this.chipsScroll.querySelectorAll('.meera-chip-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    const q = btn.getAttribute('data-query');
                    this.handleQuickSelect(q);
                });
            });
        }

        handleQuickSelect(query) {
            this.appendMessage('user', query);
            this.respondToQuery(query);
        }

        handleUserSubmit() {
            const query = this.input.value.trim();
            if (!query) return;

            this.appendMessage('user', query);
            this.input.value = '';
            this.respondToQuery(query);
        }

        appendMessage(sender, text, richHTML = '') {
            const now = new Date();
            const timeStr = now.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

            const row = document.createElement('div');
            row.className = `meera-msg-row ${sender}`;

            const avatarHTML = sender === 'bot' ? `
                <div class="meera-msg-avatar"><img src="${this.basePath}assets/meera_associates_logo.jpg" alt="MA" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;"></div>
            ` : '';

            // Format message with line breaks and markdown-style bold
            const formattedText = text ? this.formatText(text) : '';

            row.innerHTML = `
                ${avatarHTML}
                <div class="meera-msg-content-wrapper">
                    <div class="meera-msg-bubble">
                        ${formattedText}
                        ${richHTML}
                    </div>
                    <span class="meera-msg-time">${timeStr}</span>
                </div>
            `;

            this.body.appendChild(row);
            this.scrollToBottom();
            this.history.push({ sender, text, timestamp: now });
        }

        formatText(text) {
            let escaped = text
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;');

            // Bold **text**
            escaped = escaped.replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>');

            // Bullet points
            escaped = escaped.replace(/^• (.*$)/gim, '<div style="margin-left: 8px;">• $1</div>');
            escaped = escaped.replace(/^\d+\. (.*$)/gim, '<div style="margin-left: 8px;"><strong>$&</strong></div>');

            // Line breaks
            escaped = escaped.replace(/\n/g, '<br>');

            return escaped;
        }

        showTypingIndicator() {
            if (this.isTyping) return;
            this.isTyping = true;

            const typingRow = document.createElement('div');
            typingRow.className = 'meera-msg-row bot meera-typing-row';
            typingRow.id = 'meera-typing-indicator';
            typingRow.innerHTML = `
                <div class="meera-msg-avatar"><img src="${this.basePath}assets/meera_associates_logo.jpg" alt="MA" style="width: 100%; height: 100%; border-radius: 50%; object-fit: cover;"></div>
                <div class="meera-msg-content-wrapper">
                    <div class="meera-typing-indicator">
                        <div class="meera-typing-dot"></div>
                        <div class="meera-typing-dot"></div>
                        <div class="meera-typing-dot"></div>
                    </div>
                </div>
            `;
            this.body.appendChild(typingRow);
            this.scrollToBottom();
        }

        hideTypingIndicator() {
            const typingRow = document.getElementById('meera-typing-indicator');
            if (typingRow) {
                typingRow.remove();
            }
            this.isTyping = false;
        }

        // ==========================================
        // INTELLIGENT INTENT & QUERY PROCESSOR
        // ==========================================
        respondToQuery(rawQuery) {
            this.showTypingIndicator();

            const query = rawQuery.toLowerCase().trim();
            const delay = Math.min(800, Math.max(350, query.length * 15));

            setTimeout(() => {
                this.hideTypingIndicator();
                this.routeIntent(query, rawQuery);
            }, delay);
        }

        routeIntent(query, rawQuery) {
            // 1. Human Agent Handoff triggers (Specific price/quotes, live availability, order book, personalized case)
            if (this.isHandoffQuery(query)) {
                this.handleHandoffResponse(rawQuery);
                return;
            }

            // 2. Greetings
            if (/^(hi|hello|hey|namaste|greetings|good\s(morning|afternoon|evening)|halo)/i.test(query)) {
                this.appendMessage('bot', `Hello! 👋 How can I assist you with Unlisted & Pre-IPO share transactions today? You can select a quick action below or type any question.`);
                return;
            }

            // 3. Buying Process Intent (English & Hinglish)
            if (
                query.includes('how to buy') || 
                query.includes('buying process') || 
                query.includes('purchase share') || 
                query.includes('buy unlisted') || 
                query.includes('kaise buy kare') || 
                query.includes('buy kaise kare') ||
                query.includes('kharidna')
            ) {
                this.handleBuyingProcess();
                return;
            }

            // 4. Selling Process Intent (English & Hinglish)
            if (
                query.includes('how to sell') || 
                query.includes('selling process') || 
                query.includes('sell unlisted') || 
                query.includes('liquidate') || 
                query.includes('kaise beche') || 
                query.includes('sell kaise kare') ||
                query.includes('bechna')
            ) {
                this.handleSellingProcess();
                return;
            }

            // 5. Unlisted Shares definition / What are unlisted shares
            if (
                query.includes('what are unlisted') || 
                query.includes('what is unlisted') || 
                query.includes('unlisted share kya') || 
                query.includes('define unlisted') ||
                query === 'explore unlisted shares'
            ) {
                this.handleUnlistedDefinition();
                return;
            }

            // 6. Pre-IPO Shares definition
            if (
                query.includes('pre-ipo') || 
                query.includes('pre ipo') || 
                query.includes('before ipo') || 
                query.includes('pre ipo kya')
            ) {
                this.handlePreIpoDefinition();
                return;
            }

            // 7. Price Discovery
            if (
                query.includes('price discovery') || 
                query.includes('how is price determined') || 
                query.includes('rate kaise decide')
            ) {
                this.handlePriceDiscovery();
                return;
            }

            // 8. Demat Process / Requirements
            if (
                query.includes('demat') || 
                query.includes('cml') || 
                query.includes('client master') || 
                query.includes('nsdl') || 
                query.includes('cdsl')
            ) {
                this.handleDematProcess();
                return;
            }

            // 9. KYC & Documents
            if (
                query.includes('kyc') || 
                query.includes('document') || 
                query.includes('paperwork') || 
                query.includes('pan card') || 
                query.includes('aadhaar')
            ) {
                this.handleKycInfo();
                return;
            }

            // 10. Settlement & Timeline
            if (
                query.includes('settlement') || 
                query.includes('timeline') || 
                query.includes('how long') || 
                query.includes('kitna time')
            ) {
                this.handleSettlementInfo();
                return;
            }

            // 11. Off-Market Transaction
            if (
                query.includes('off-market') || 
                query.includes('off market') || 
                query.includes('otc')
            ) {
                this.handleOffMarketInfo();
                return;
            }

            // 12. Taxation
            if (
                query.includes('tax') || 
                query.includes('stcg') || 
                query.includes('ltcg') || 
                query.includes('capital gains')
            ) {
                this.handleTaxInfo();
                return;
            }

            // 13. Guaranteed returns / Risk
            if (
                query.includes('guarantee') || 
                query.includes('safe') || 
                query.includes('fixed return') || 
                query.includes('profit')
            ) {
                this.handleGuaranteedReturnsInfo();
                return;
            }

            // 14. NRI participation
            if (
                query.includes('nri') || 
                query.includes('non resident') || 
                query.includes('foreign')
            ) {
                this.handleNriInfo();
                return;
            }

            // 15. Contact Details
            if (
                query.includes('contact') || 
                query.includes('phone') || 
                query.includes('number') || 
                query.includes('email') || 
                query.includes('address') || 
                query.includes('call') || 
                query.includes('whatsapp') ||
                query === 'contact meera associates'
            ) {
                this.handleContactInfo();
                return;
            }

            // 16. Company Information Catalog Lookup
            const companyMatch = this.findCompanyMatch(query);
            if (companyMatch) {
                this.handleCompanyProfile(companyMatch);
                return;
            }

            if (query.includes('company information') || query.includes('companies list') || query.includes('available companies')) {
                this.handleCompaniesList();
                return;
            }

            // 17. Enquire Shares Intent & Form trigger
            if (
                query === 'enquire shares' || 
                query === 'enquire' || 
                query === 'inquire' || 
                query === 'enquire shares form' || 
                query.includes('enquire share') || 
                query.includes('inquire share') || 
                query.includes('enquiry form') ||
                query.includes('interested') || 
                query.includes('contact me') || 
                query.includes('callback') || 
                query.includes('call me')
            ) {
                this.handleEnquiryForm();
                return;
            }

            // 18. General FAQ Search fallback
            const matchedFaq = this.searchFaqs(query);
            if (matchedFaq) {
                this.appendMessage('bot', matchedFaq.a);
                return;
            }

            // 19. Honest Fallback when AI does not know the answer
            this.handleDefaultFallback(rawQuery);
        }

        // ==========================================
        // SPECIFIC INTENT HANDLERS
        // ==========================================

        isHandoffQuery(query) {
            const handoffKeywords = [
                'current price of',
                'todays price',
                'exact rate',
                'live price',
                'current rate',
                'how many shares available',
                'selling quote',
                'my payment',
                'bank account details',
                'cheque deposit',
                'dis slip status',
                'my transaction status'
            ];
            return handoffKeywords.some(keyword => query.includes(keyword));
        }

        handleHandoffResponse(rawQuery) {
            const text = `I’ll connect you with the Meera Associates team for the latest transaction-specific information.

Our private equity execution desk provides verified live order availability, current indicative pricing, lot sizes, and customized settlement procedures directly.`;

            const cardHTML = `
                <div class="chat-contact-card">
                    <div class="chat-contact-title">
                        <span>🤝</span> Connect With Our Team
                    </div>
                    <p style="font-size: 11.5px; color: var(--chat-text-muted); margin-bottom: 10px;">
                        Speak with our senior desk for live rates and off-market lot allocations:
                    </p>
                    <div class="chat-contact-grid">
                        <a href="tel:+918983388881" class="chat-action-btn chat-btn-primary">
                            📞 Call Desk
                        </a>
                        <a href="${this.whatsappLink}" target="_blank" rel="noopener" class="chat-action-btn chat-btn-whatsapp">
                            ${this.waIconSvg} WhatsApp
                        </a>
                    </div>
                </div>
            `;

            this.appendMessage('bot', text, cardHTML);
        }

        handleUnlistedDefinition() {
            const text = `**Unlisted shares** are shares of companies that are not currently traded on stock exchanges such as NSE or BSE. These shares may be transacted through private/off-market mechanisms, subject to applicable rules and documentation.

Here is the available company information and transaction process. Please conduct your own research and make decisions based on your requirements.`;

            const cardHTML = `
                <div style="margin-top: 10px; display: flex; flex-direction: column; gap: 6px;">
                    <a href="${this.basePath}unlisted-shares.html" class="meera-chip-btn" style="text-align: center; text-decoration: none; font-weight: 700; border-color: var(--meera-sky-blue);">
                        🔍 Open Unlisted Shares Directory
                    </a>
                    <button class="meera-chip-btn" onclick="window.MeeraChatbotInstance.handleQuickSelect('How to buy unlisted shares')">
                        💰 How to Buy Unlisted Shares
                    </button>
                    <button class="meera-chip-btn" onclick="window.MeeraChatbotInstance.handleQuickSelect('How to sell unlisted shares')">
                        🔄 How to Sell Unlisted Shares
                    </button>
                    <button class="meera-chip-btn" onclick="window.MeeraChatbotInstance.handleQuickSelect('What is price discovery?')">
                        📈 Price Discovery Process
                    </button>
                    <button class="meera-chip-btn" onclick="window.MeeraChatbotInstance.handleQuickSelect('Available companies list')">
                        🏢 View Available Companies
                    </button>
                </div>
            `;

            this.appendMessage('bot', text, cardHTML);
        }

        handlePreIpoDefinition() {
            const text = `**Pre-IPO shares** are equity shares of mature, high-growth private enterprises acquired prior to an Initial Public Offering (IPO) or formal stock exchange listing.

This allows eligible investors to participate in established companies before their public market debut, subject to applicable regulatory guidelines, statutory lock-in periods, and private market valuation dynamics.`;

            this.appendMessage('bot', text);
        }

        handleBuyingProcess() {
            const text = `To buy unlisted shares through Meera Associates, here is our transparent 7-step execution process:`;

            const stepsHTML = `
                <div class="chat-process-card">
                    ${(this.kb.buyingProcess || []).map(s => `
                        <div class="chat-process-step">
                            <div class="chat-step-num">${s.step}</div>
                            <div class="chat-step-info">
                                <h5>${s.title}</h5>
                                <p>${s.desc}</p>
                            </div>
                        </div>
                    `).join('')}
                    <div style="margin-top: 10px; display: flex; gap: 8px;">
                        <button class="chat-action-btn chat-btn-primary" style="flex: 1;" onclick="window.MeeraChatbotInstance.handleLeadFormPrompt('buy')">
                            Talk to Meera Associates
                        </button>
                        <a href="tel:+918983388881" class="chat-action-btn chat-btn-secondary">
                            📞 Direct Call
                        </a>
                    </div>
                </div>
            `;

            this.appendMessage('bot', text, stepsHTML);
        }

        handleSellingProcess() {
            const text = `Selling unlisted shares generally involves checking the availability of buyers, applicable pricing, documentation, Demat details, and completing the required off-market transfer and settlement process:`;

            const stepsHTML = `
                <div class="chat-process-card">
                    ${(this.kb.sellingProcess || []).map(s => `
                        <div class="chat-process-step">
                            <div class="chat-step-num">${s.step}</div>
                            <div class="chat-step-info">
                                <h5>${s.title}</h5>
                                <p>${s.desc}</p>
                            </div>
                        </div>
                    `).join('')}
                    <div style="margin-top: 10px; display: flex; gap: 8px;">
                        <button class="chat-action-btn chat-btn-primary" style="flex: 1;" onclick="window.MeeraChatbotInstance.handleLeadFormPrompt('sell')">
                            Contact Our Team for Selling
                        </button>
                        <a href="tel:+918983388881" class="chat-action-btn chat-btn-secondary">
                            📞 Direct Call
                        </a>
                    </div>
                </div>
            `;

            this.appendMessage('bot', text, stepsHTML);
        }

        handlePriceDiscovery() {
            const text = `**Price discovery** is the process through which a transaction price is determined between buyers and sellers based on factors such as availability, demand, quantity, company information, and prevailing market conditions.

Please note that indicative prices in the private market are never guaranteed or recommended values. Meera Associates facilitates off-market transactions at mutually agreed prices between transacting parties.`;

            this.appendMessage('bot', text);
        }

        handleDematProcess() {
            const text = `**Demat Process & Electronic Holdings:**

Unlisted shares are generally held electronically in a Demat account. In accordance with SEBI guidelines, physical transfer of unlisted shares is discontinued.

**Key Requirements:**
• Valid NSDL or CDSL Demat Account
• Signed & Stamped Client Master List (CML)
• Active status matching your PAN and Bank Account

Need help with the Demat process? Our team assists clients with Demat mapping and paperless electronic transfers.`;

            const buttonsHTML = `
                <div style="margin-top: 8px; display: flex; gap: 8px;">
                    <a href="tel:+918983388881" class="chat-action-btn chat-btn-primary">
                        📞 Inquire Demat Assistance
                    </a>
                    <button class="chat-action-btn chat-btn-secondary" onclick="window.MeeraChatbotInstance.handleQuickSelect('What documents are required for KYC')">
                        📋 View KYC Checklist
                    </button>
                </div>
            `;

            this.appendMessage('bot', text, buttonsHTML);
        }

        handleKycInfo() {
            const text = `**KYC & Document Verification:**

Required documentation may include identity, address, PAN, and other transaction-related information depending on the applicable process.

• **PAN Card** (Mandatory for all capital-market transactions)
• **Proof of Identity & Address** (Aadhaar / Passport / Voter ID)
• **Demat Client Master List (CML)** with active seal
• **Cancelled Cheque / Bank Statement** matching Demat name
• *For Corporate/HUF:* Board resolution & authorized signatory proof.

Our team will guide you through the required documentation for your transaction.`;

            this.appendMessage('bot', text);
        }

        handleSettlementInfo() {
            const text = `**Settlement & Turnaround Timelines:**

• **Buyer Share Credit:** Target delivery within 24 Hours upon verified receipt of funds and Demat CML.
• **Seller Bank Payout:** Direct RTGS/NEFT payout within 24 Hours upon verified confirmation of depository share transfer.

All transactions follow strict depository (NSDL/CDSL) off-market clearing standards.`;

            this.appendMessage('bot', text);
        }

        handleOffMarketInfo() {
            const text = `**What is an Off-Market Transaction?**

An off-market transaction is a direct transfer of securities between two Demat accounts through national depositories (NSDL / CDSL) without routing through public exchange order-matching engines.

Transfers are executed via Delivery Instruction Slips (DIS) or verified online depository facilities (CDSL Easiest / NSDL SPEED-e).`;

            this.appendMessage('bot', text);
        }

        handleTaxInfo() {
            const text = `**Taxation Guidelines for Unlisted Shares (India):**

• **Short-Term Capital Gains (STCG):** Holding period of 24 months or less; taxed at the investor's applicable personal income tax slab rate.
• **Long-Term Capital Gains (LTCG):** Holding period exceeding 24 months; generally taxed at 12.5% without indexation benefits (as per recent Finance Act revisions).
• **STT:** Securities Transaction Tax (STT) is not applicable on off-market transactions.

*Disclaimer: Tax rules depend on the transaction and individual investor circumstances. Please consult your chartered accountant or tax advisor for specific guidance.*`;

            this.appendMessage('bot', text);
        }

        handleGuaranteedReturnsInfo() {
            const text = `**Risk & Return Policy:**

No. Unlisted shares are equity instruments and carry inherent market risks; they are **NOT guaranteed to generate returns**. 

Values fluctuate according to company business performance, broader market cycles, liquidity, and eventual listing conditions. Meera Associates strictly does not provide guaranteed returns, investment promises, or speculative forecasts. Investors should conduct their own due diligence before transacting.`;

            this.appendMessage('bot', text);
        }

        handleNriInfo() {
            const text = `**NRI Participation in Unlisted Shares:**

Yes, Non-Resident Indians (NRIs) can participate in unlisted share transactions in compliance with RBI FEMA regulations and Foreign Direct Investment (FDI) guidelines.

Transactions require an active NRE (repatriable) or NRO (non-repatriable) Demat account and linked bank verification. Our team assists NRI clients with complete documentation and repatriation clearance.`;

            this.appendMessage('bot', text);
        }

        handleContactInfo() {
            const text = `Here are the official contact details for Meera Associates:`;

            const cardHTML = `
                <div class="chat-contact-card">
                    <div class="chat-contact-title">
                        <span>🏢</span> Meera Associates
                    </div>
                    <div style="font-size: 12px; line-height: 1.6; color: var(--chat-text-muted); margin-bottom: 12px;">
                        <div>📞 Desk 1: <a href="tel:+918983388881" style="color: var(--chat-sky); text-decoration: none;"><strong>+91 8983388881</strong></a></div>
                        <div>📞 Desk 2: <a href="tel:+918888415222" style="color: var(--chat-sky); text-decoration: none;"><strong>+91 8888415222</strong></a></div>
                        <div>${this.waIconSvg} WhatsApp: <a href="https://wa.me/918983388881" target="_blank" rel="noopener" style="color: #15803d; text-decoration: none;"><strong>Chat on WhatsApp &rarr;</strong></a></div>
                        <div>🏢 Office: <a href="tel:+919028345588" style="color: var(--chat-sky); text-decoration: none;"><strong>+91 9028345588</strong></a></div>
                        <div>📧 <a href="mailto:contact.meeraassociates@gmail.com" style="color: var(--chat-sky); text-decoration: none;">contact.meeraassociates@gmail.com</a></div>
                    </div>

                    <div class="chat-contact-grid">
                        <a href="tel:+918983388881" class="chat-action-btn chat-btn-primary">
                            📞 Call Us
                        </a>
                        <a href="${this.whatsappLink}" target="_blank" rel="noopener" class="chat-action-btn chat-btn-whatsapp">
                            ${this.waIconSvg} Chat on WhatsApp
                        </a>
                        <a href="mailto:contact.meeraassociates@gmail.com" class="chat-action-btn chat-btn-secondary">
                            ✉️ Email Us
                        </a>
                    </div>
                </div>
            `;

            this.appendMessage('bot', text, cardHTML);
        }

        findCompanyMatch(query) {
            const companies = (this.kb && this.kb.companies) ? this.kb.companies : [];
            for (const company of companies) {
                if (query.includes(company.name.toLowerCase())) return company;
                for (const alias of (company.aliases || [])) {
                    if (query.includes(alias.toLowerCase())) return company;
                }
            }
            return null;
        }

        handleCompanyProfile(company) {
            const text = `Here is the available company information and transaction process for **${company.name}**:`;

            const cardHTML = `
                <div class="chat-company-card">
                    <div class="chat-company-header">
                        <div class="chat-company-title">${company.name}</div>
                        <span class="chat-company-badge">${company.industry}</span>
                    </div>

                    <p class="chat-company-desc">${company.overview}</p>

                    <div style="font-size: 11px; font-weight: 700; color: var(--chat-sky); margin-bottom: 4px; text-transform: uppercase;">
                        Key Highlights:
                    </div>
                    <ul class="chat-company-highlights">
                        ${(company.highlights || []).map(h => `<li>${h}</li>`).join('')}
                    </ul>

                    <div style="font-size: 11.5px; color: #fbbf24; background: rgba(251, 191, 36, 0.08); border: 1px solid rgba(251, 191, 36, 0.25); border-radius: 6px; padding: 6px 10px; margin-bottom: 10px;">
                        📌 <strong>Transaction Status:</strong> ${company.availableInfo || 'Available for transaction discussion'}
                    </div>

                    <div class="chat-company-footer">
                        <button class="chat-action-btn chat-btn-primary" style="flex: 1;" onclick="window.MeeraChatbotInstance.handleLeadFormPrompt('buy', '${company.name}')">
                            Inquire Shares
                        </button>
                        <a href="${company.website || '#'}" target="_blank" rel="noopener" class="chat-action-btn chat-btn-secondary">
                            Official Site ↗
                        </a>
                    </div>
                </div>
                <div style="font-size: 10px; color: var(--chat-text-muted); margin-top: 6px; line-height: 1.35;">
                    *Note: Indicative and unlisted share information is subject to prevailing private market liquidity. Please conduct your own research.
                </div>
            `;

            this.appendMessage('bot', text, cardHTML);
        }

        handleCompaniesList() {
            const text = `Here are some of the prominent unlisted and pre-IPO enterprises transacted through Meera Associates:`;

            const companies = (this.kb && this.kb.companies) ? this.kb.companies : [];
            const listHTML = `
                <div style="margin-top: 8px; display: flex; flex-wrap: wrap; gap: 6px;">
                    ${companies.map(c => `
                        <button class="meera-chip-btn" onclick="window.MeeraChatbotInstance.handleQuickSelect('${c.name}')">
                            ${c.name}
                        </button>
                    `).join('')}
                </div>
                <p style="font-size: 11.5px; color: var(--chat-text-muted); margin-top: 10px;">
                    Looking for a specific company not shown here? Type its name to check or reach out directly to our desk.
                </p>
            `;

            this.appendMessage('bot', text, listHTML);
        }

        buildEnquiryFormHTML(formId, defaultType = 'Buy', defaultCompany = '') {
            return `
                <div class="chat-lead-form" id="${formId}">
                    <div class="chat-lead-title" style="display: flex; align-items: center; gap: 6px;">
                        <span>📈</span> Enquire Shares
                    </div>
                    <div class="chat-lead-subtitle">Direct institutional & private-market transaction desk</div>

                    <div class="chat-lead-group">
                        <label class="chat-lead-label">Name *</label>
                        <input type="text" class="chat-lead-input" name="lead_name" placeholder="Full Name" required>
                    </div>

                    <div class="chat-lead-row">
                        <div class="chat-lead-group">
                            <label class="chat-lead-label">Mobile Number *</label>
                            <input type="tel" class="chat-lead-input" name="lead_mobile" placeholder="+91 Mobile Number" required>
                        </div>
                        <div class="chat-lead-group">
                            <label class="chat-lead-label">Email Address</label>
                            <input type="email" class="chat-lead-input" name="lead_email" placeholder="name@domain.com">
                        </div>
                    </div>

                    <div class="chat-lead-group">
                        <label class="chat-lead-label">Company / Share Name</label>
                        <input type="text" class="chat-lead-input" name="lead_company" placeholder="e.g. Tata Tech, NSE, Reliance Retail" value="${defaultCompany}">
                    </div>

                    <div class="chat-lead-row">
                        <div class="chat-lead-group">
                            <label class="chat-lead-label">Buy / Sell</label>
                            <select class="chat-lead-select" name="lead_type">
                                <option value="Buy" ${defaultType.toLowerCase() === 'buy' ? 'selected' : ''}>Buy</option>
                                <option value="Sell" ${defaultType.toLowerCase() === 'sell' ? 'selected' : ''}>Sell</option>
                            </select>
                        </div>
                        <div class="chat-lead-group">
                            <label class="chat-lead-label">Quantity</label>
                            <input type="number" class="chat-lead-input" name="lead_qty" placeholder="Number of shares">
                        </div>
                    </div>

                    <div class="chat-lead-group">
                        <label class="chat-lead-label">Message / Requirement</label>
                        <textarea class="chat-lead-input" name="lead_message" placeholder="Message or specific requirement..." rows="2" style="resize: vertical;"></textarea>
                    </div>

                    <button type="button" class="chat-lead-submit" onclick="window.MeeraChatbotInstance.submitEnquiryForm('${formId}')">
                        Submit Enquiry
                    </button>

                    <div class="chat-lead-disclaimer">
                        🔒 Safe & Secure. We will NEVER ask for passwords, OTPs, or bank PINs.
                    </div>
                </div>
            `;
        }

        handleEnquiryForm(defaultType = 'Buy', defaultCompany = '') {
            const text = `Please fill out your details below and our team will get in touch with you:`;
            const formId = `enquiry-form-${Date.now()}`;
            const formHTML = this.buildEnquiryFormHTML(formId, defaultType, defaultCompany);
            this.appendMessage('bot', text, formHTML);
        }

        handleLeadFormPrompt(defaultType = 'Buy', defaultCompany = '') {
            this.handleEnquiryForm(defaultType, defaultCompany);
        }

        submitEnquiryForm(formId) {
            const formContainer = document.getElementById(formId);
            if (!formContainer) return;

            const nameInput = formContainer.querySelector('input[name="lead_name"]');
            const mobileInput = formContainer.querySelector('input[name="lead_mobile"]');
            const emailInput = formContainer.querySelector('input[name="lead_email"]');
            const typeInput = formContainer.querySelector('select[name="lead_type"]');
            const qtyInput = formContainer.querySelector('input[name="lead_qty"]');
            const companyInput = formContainer.querySelector('input[name="lead_company"]');
            const msgInput = formContainer.querySelector('textarea[name="lead_message"]');

            const name = nameInput ? nameInput.value.trim() : '';
            const mobile = mobileInput ? mobileInput.value.trim() : '';
            const email = emailInput ? emailInput.value.trim() : '';
            const type = typeInput ? typeInput.value : 'Buy';
            const qty = qtyInput ? qtyInput.value.trim() : '';
            const company = companyInput ? companyInput.value.trim() : '';
            const message = msgInput ? msgInput.value.trim() : '';

            if (!name || !mobile) {
                alert('Please enter your Name and Mobile Number to proceed.');
                return;
            }

            // Save lead in localStorage for persistence
            const leads = JSON.parse(localStorage.getItem('meera_leads') || '[]');
            leads.push({
                name,
                mobile,
                email,
                type,
                qty,
                company,
                message,
                timestamp: new Date().toISOString()
            });
            localStorage.setItem('meera_leads', JSON.stringify(leads));

            // Replace form with confirmation
            formContainer.innerHTML = `
                <div style="text-align: center; padding: 14px 8px;">
                    <div style="font-size: 32px; margin-bottom: 8px;">✅</div>
                    <div style="font-size: 14px; font-weight: 800; color: var(--chat-text-main); margin-bottom: 6px; line-height: 1.4;">
                        Thank you for your enquiry. Our Meera Associates team will contact you with the relevant information.
                    </div>
                    <p style="font-size: 11.5px; color: var(--chat-text-muted); margin-bottom: 14px;">
                        Requirement registered for <strong>${name}</strong> (${mobile}) — ${type}${company ? ' • ' + company : ''}.
                    </p>
                    <div style="display: flex; gap: 8px;">
                        <a href="https://wa.me/918983388881?text=Hello%20Meera%20Associates,%20I%20have%20submitted%20an%20enquiry%20for%20${encodeURIComponent(company || 'Unlisted Shares')}%20(Name:%20${encodeURIComponent(name)})" target="_blank" rel="noopener" class="chat-action-btn chat-btn-whatsapp" style="flex: 1;">
                            ${this.waIconSvg} Chat on WhatsApp
                        </a>
                        <a href="tel:+918983388881" class="chat-action-btn chat-btn-primary" style="flex: 1;">
                            📞 Call Desk
                        </a>
                    </div>
                </div>
            `;

            this.appendMessage('bot', `Thank you for your enquiry. Our Meera Associates team will contact you with the relevant information.`);
        }

        submitLeadForm(formId) {
            this.submitEnquiryForm(formId);
        }

        searchFaqs(query) {
            const faqs = (this.kb && this.kb.faqs) ? this.kb.faqs : [];
            for (const faq of faqs) {
                if (!faq.keywords) continue;
                for (const keyword of faq.keywords) {
                    if (query.includes(keyword.toLowerCase())) {
                        return faq;
                    }
                }
            }
            return null;
        }

        handleDefaultFallback(rawQuery) {
            const text = `I’m sorry, I don’t have the right information to answer that at the moment. Our Meera Associates team can help you with the latest details.`;

            const formId = `enquiry-form-${Date.now()}`;
            const formHTML = this.buildEnquiryFormHTML(formId, 'Buy', '');

            this.appendMessage('bot', text, formHTML);
        }
    }

    // Auto-initialize when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', () => {
            window.MeeraChatbotInstance = new MeeraChatbot();
        });
    } else {
        window.MeeraChatbotInstance = new MeeraChatbot();
    }

})();
